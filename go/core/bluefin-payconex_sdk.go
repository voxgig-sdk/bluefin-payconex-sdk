package core

import (
	"fmt"

	vs "github.com/voxgig-sdk/bluefin-payconex-sdk/go/utility/struct"
)

type BluefinPayconexSDK struct {
	Mode     string
	options  map[string]any
	utility  *Utility
	Features []Feature
	rootctx  *Context
}

func NewBluefinPayconexSDK(options map[string]any) *BluefinPayconexSDK {
	sdk := &BluefinPayconexSDK{
		Mode:     "live",
		Features: []Feature{},
	}

	sdk.utility = NewUtility()

	config := MakeConfig()

	sdk.rootctx = sdk.utility.MakeContext(map[string]any{
		"client":  sdk,
		"utility": sdk.utility,
		"config":  config,
		"options": options,
		"shared":  map[string]any{},
	}, nil)

	sdk.options = sdk.utility.MakeOptions(sdk.rootctx)

	if vs.GetPath([]any{"feature", "test", "active"}, sdk.options) == true {
		sdk.Mode = "test"
	}

	sdk.rootctx.Options = sdk.options

	// Add features in the resolved order (MakeOptions puts an explicit array
	// order first, else defaults to test-first). Ordering matters: the `test`
	// feature installs the base mock transport and the transport features
	// (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
	// must be added before them to sit at the base of the chain.
	featureOpts := ToMapAny(vs.GetProp(sdk.options, "feature"))
	if featureOpts != nil {
		if fo, ok := vs.GetPath([]any{"__derived__", "featureorder"}, sdk.options).([]any); ok {
			for _, n := range fo {
				fname, _ := n.(string)
				fopts := ToMapAny(featureOpts[fname])
				if fopts != nil {
					if active, ok := fopts["active"]; ok {
						if ab, ok := active.(bool); ok && ab {
							sdk.utility.FeatureAdd(sdk.rootctx, makeFeature(fname))
						}
					}
				}
			}
		}
	}

	// Add extension features.
	if extend := vs.GetProp(sdk.options, "extend"); extend != nil {
		if extList, ok := extend.([]any); ok {
			for _, f := range extList {
				if feat, ok := f.(Feature); ok {
					sdk.utility.FeatureAdd(sdk.rootctx, feat)
				}
			}
		}
	}

	// Initialize features.
	for _, f := range sdk.Features {
		sdk.utility.FeatureInit(sdk.rootctx, f)
	}

	sdk.utility.FeatureHook(sdk.rootctx, "PostConstruct")

	return sdk
}

func (sdk *BluefinPayconexSDK) OptionsMap() map[string]any {
	out := vs.Clone(sdk.options)
	if om, ok := out.(map[string]any); ok {
		return om
	}
	return map[string]any{}
}

func (sdk *BluefinPayconexSDK) GetUtility() *Utility {
	return CopyUtility(sdk.utility)
}

func (sdk *BluefinPayconexSDK) GetRootCtx() *Context {
	return sdk.rootctx
}

func (sdk *BluefinPayconexSDK) Prepare(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "prepare",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	options := sdk.options

	path, _ := vs.GetProp(fetchargs, "path").(string)
	method, _ := vs.GetProp(fetchargs, "method").(string)
	if method == "" {
		method = "GET"
	}

	params := ToMapAny(vs.GetProp(fetchargs, "params"))
	if params == nil {
		params = map[string]any{}
	}
	query := ToMapAny(vs.GetProp(fetchargs, "query"))
	if query == nil {
		query = map[string]any{}
	}

	headers := utility.PrepareHeaders(ctx)

	base, _ := vs.GetProp(options, "base").(string)
	prefix, _ := vs.GetProp(options, "prefix").(string)
	suffix, _ := vs.GetProp(options, "suffix").(string)

	ctx.Spec = NewSpec(map[string]any{
		"base":    base,
		"prefix":  prefix,
		"suffix":  suffix,
		"path":    path,
		"method":  method,
		"params":  params,
		"query":   query,
		"headers": headers,
		"body":    vs.GetProp(fetchargs, "body"),
		"step":    "start",
	})

	// Merge user-provided headers.
	if uh := vs.GetProp(fetchargs, "headers"); uh != nil {
		if uhm, ok := uh.(map[string]any); ok {
			for k, v := range uhm {
				ctx.Spec.Headers[k] = v
			}
		}
	}

	_, err := utility.PrepareAuth(ctx)
	if err != nil {
		return nil, err
	}

	return utility.MakeFetchDef(ctx)
}

func (sdk *BluefinPayconexSDK) Direct(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	fetchdef, err := sdk.Prepare(fetchargs)
	if err != nil {
		return map[string]any{"ok": false, "err": err}, nil
	}

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "direct",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	url, _ := fetchdef["url"].(string)
	fetched, fetchErr := utility.Fetcher(ctx, url, fetchdef)

	if fetchErr != nil {
		return map[string]any{"ok": false, "err": fetchErr}, nil
	}

	if fetched == nil {
		return map[string]any{
			"ok":  false,
			"err": ctx.MakeError("direct_no_response", "response: undefined"),
		}, nil
	}

	if fm, ok := fetched.(map[string]any); ok {
		status := ToInt(vs.GetProp(fm, "status"))
		headers := vs.GetProp(fm, "headers")

		// No-body responses (204, 304) and explicit zero content-length
		// must skip JSON parsing — calling json() on an empty body errors.
		var contentLength string
		if hm, ok := headers.(map[string]any); ok {
			if cl, ok := hm["content-length"]; ok {
				contentLength = fmt.Sprintf("%v", cl)
			}
		}
		noBody := status == 204 || status == 304 || contentLength == "0"

		var jsonData any
		if !noBody {
			if jf := vs.GetProp(fm, "json"); jf != nil {
				if f, ok := jf.(func() any); ok {
					// f() returns nil on parse error in our fetcher.
					jsonData = f()
				}
			}
		}

		return map[string]any{
			"ok":      status >= 200 && status < 300,
			"status":  status,
			"headers": headers,
			"data":    jsonData,
		}, nil
	}

	return map[string]any{"ok": false, "err": ctx.MakeError("direct_invalid", "invalid response type")}, nil
}


// AccountUpdater returns a AccountUpdater entity bound to this client.
// Idiomatic usage: client.AccountUpdater(nil).List(nil, nil) or
// client.AccountUpdater(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) AccountUpdater(data map[string]any) BluefinPayconexEntity {
	return NewAccountUpdaterEntityFunc(sdk, data)
}


// AccountUpdaterSchedule returns a AccountUpdaterSchedule entity bound to this client.
// Idiomatic usage: client.AccountUpdaterSchedule(nil).List(nil, nil) or
// client.AccountUpdaterSchedule(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) AccountUpdaterSchedule(data map[string]any) BluefinPayconexEntity {
	return NewAccountUpdaterScheduleEntityFunc(sdk, data)
}


// AccountUpdaterScheduleWithResult returns a AccountUpdaterScheduleWithResult entity bound to this client.
// Idiomatic usage: client.AccountUpdaterScheduleWithResult(nil).List(nil, nil) or
// client.AccountUpdaterScheduleWithResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) AccountUpdaterScheduleWithResult(data map[string]any) BluefinPayconexEntity {
	return NewAccountUpdaterScheduleWithResultEntityFunc(sdk, data)
}


// AccountUpdaterSubscriptionWithResult returns a AccountUpdaterSubscriptionWithResult entity bound to this client.
// Idiomatic usage: client.AccountUpdaterSubscriptionWithResult(nil).List(nil, nil) or
// client.AccountUpdaterSubscriptionWithResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) AccountUpdaterSubscriptionWithResult(data map[string]any) BluefinPayconexEntity {
	return NewAccountUpdaterSubscriptionWithResultEntityFunc(sdk, data)
}


// AccountUpdaterUpdate returns a AccountUpdaterUpdate entity bound to this client.
// Idiomatic usage: client.AccountUpdaterUpdate(nil).List(nil, nil) or
// client.AccountUpdaterUpdate(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) AccountUpdaterUpdate(data map[string]any) BluefinPayconexEntity {
	return NewAccountUpdaterUpdateEntityFunc(sdk, data)
}


// ApiKey returns a ApiKey entity bound to this client.
// Idiomatic usage: client.ApiKey(nil).List(nil, nil) or
// client.ApiKey(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ApiKey(data map[string]any) BluefinPayconexEntity {
	return NewApiKeyEntityFunc(sdk, data)
}


// ApplePayMerchantDetail returns a ApplePayMerchantDetail entity bound to this client.
// Idiomatic usage: client.ApplePayMerchantDetail(nil).List(nil, nil) or
// client.ApplePayMerchantDetail(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ApplePayMerchantDetail(data map[string]any) BluefinPayconexEntity {
	return NewApplePayMerchantDetailEntityFunc(sdk, data)
}


// ApplePaySession returns a ApplePaySession entity bound to this client.
// Idiomatic usage: client.ApplePaySession(nil).List(nil, nil) or
// client.ApplePaySession(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ApplePaySession(data map[string]any) BluefinPayconexEntity {
	return NewApplePaySessionEntityFunc(sdk, data)
}


// DynamicDescriptor returns a DynamicDescriptor entity bound to this client.
// Idiomatic usage: client.DynamicDescriptor(nil).List(nil, nil) or
// client.DynamicDescriptor(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) DynamicDescriptor(data map[string]any) BluefinPayconexEntity {
	return NewDynamicDescriptorEntityFunc(sdk, data)
}


// IFrameCreateInstance returns a IFrameCreateInstance entity bound to this client.
// Idiomatic usage: client.IFrameCreateInstance(nil).List(nil, nil) or
// client.IFrameCreateInstance(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) IFrameCreateInstance(data map[string]any) BluefinPayconexEntity {
	return NewIFrameCreateInstanceEntityFunc(sdk, data)
}


// IFrameInstance returns a IFrameInstance entity bound to this client.
// Idiomatic usage: client.IFrameInstance(nil).List(nil, nil) or
// client.IFrameInstance(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) IFrameInstance(data map[string]any) BluefinPayconexEntity {
	return NewIFrameInstanceEntityFunc(sdk, data)
}


// Iframe returns a Iframe entity bound to this client.
// Idiomatic usage: client.Iframe(nil).List(nil, nil) or
// client.Iframe(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) Iframe(data map[string]any) BluefinPayconexEntity {
	return NewIframeEntityFunc(sdk, data)
}


// Init returns a Init entity bound to this client.
// Idiomatic usage: client.Init(nil).List(nil, nil) or
// client.Init(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) Init(data map[string]any) BluefinPayconexEntity {
	return NewInitEntityFunc(sdk, data)
}


// ListApiKeyScopesEntry returns a ListApiKeyScopesEntry entity bound to this client.
// Idiomatic usage: client.ListApiKeyScopesEntry(nil).List(nil, nil) or
// client.ListApiKeyScopesEntry(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ListApiKeyScopesEntry(data map[string]any) BluefinPayconexEntity {
	return NewListApiKeyScopesEntryEntityFunc(sdk, data)
}


// PaymentIframe returns a PaymentIframe entity bound to this client.
// Idiomatic usage: client.PaymentIframe(nil).List(nil, nil) or
// client.PaymentIframe(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) PaymentIframe(data map[string]any) BluefinPayconexEntity {
	return NewPaymentIframeEntityFunc(sdk, data)
}


// ThreeDSecureAuth returns a ThreeDSecureAuth entity bound to this client.
// Idiomatic usage: client.ThreeDSecureAuth(nil).List(nil, nil) or
// client.ThreeDSecureAuth(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ThreeDSecureAuth(data map[string]any) BluefinPayconexEntity {
	return NewThreeDSecureAuthEntityFunc(sdk, data)
}


// ThreeDSecureBrowserInit returns a ThreeDSecureBrowserInit entity bound to this client.
// Idiomatic usage: client.ThreeDSecureBrowserInit(nil).List(nil, nil) or
// client.ThreeDSecureBrowserInit(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ThreeDSecureBrowserInit(data map[string]any) BluefinPayconexEntity {
	return NewThreeDSecureBrowserInitEntityFunc(sdk, data)
}


// ThreeDSecureStatus returns a ThreeDSecureStatus entity bound to this client.
// Idiomatic usage: client.ThreeDSecureStatus(nil).List(nil, nil) or
// client.ThreeDSecureStatus(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) ThreeDSecureStatus(data map[string]any) BluefinPayconexEntity {
	return NewThreeDSecureStatusEntityFunc(sdk, data)
}


// TransactionDetail returns a TransactionDetail entity bound to this client.
// Idiomatic usage: client.TransactionDetail(nil).List(nil, nil) or
// client.TransactionDetail(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) TransactionDetail(data map[string]any) BluefinPayconexEntity {
	return NewTransactionDetailEntityFunc(sdk, data)
}


// Webhook returns a Webhook entity bound to this client.
// Idiomatic usage: client.Webhook(nil).List(nil, nil) or
// client.Webhook(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinPayconexSDK) Webhook(data map[string]any) BluefinPayconexEntity {
	return NewWebhookEntityFunc(sdk, data)
}



func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinPayconexSDK {
	if sdkopts == nil {
		sdkopts = map[string]any{}
	}
	sdkopts = vs.Clone(sdkopts).(map[string]any)

	if testopts == nil {
		testopts = map[string]any{}
	}
	testopts = vs.Clone(testopts).(map[string]any)
	testopts["active"] = true

	vs.SetPath(sdkopts, []any{"feature", "test"}, testopts)

	sdk := NewBluefinPayconexSDK(sdkopts)
	sdk.Mode = "test"

	return sdk
}
