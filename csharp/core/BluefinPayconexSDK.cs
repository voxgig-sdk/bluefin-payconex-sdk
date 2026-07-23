// BluefinPayconex SDK client.

using Voxgig.Struct;

using BluefinPayconexSdk.Feature;

namespace BluefinPayconexSdk;

public class BluefinPayconexSDK
{
    public string Mode = "live";
    private Dictionary<string, object?> _options;
    private readonly Utility _utility;
    public List<BaseFeature> Features = new();
    private readonly Context _rootctx;

    public BluefinPayconexSDK(Dictionary<string, object?>? options = null)
    {
        _utility = new Utility();

        var config = SdkConfig.MakeConfig();

        _rootctx = _utility.MakeContext(new Dictionary<string, object?>
        {
            ["client"] = this,
            ["utility"] = _utility,
            ["config"] = config,
            ["options"] = options,
            ["shared"] = new Dictionary<string, object?>(),
        }, null);

        _options = _utility.MakeOptions(_rootctx);

        if (Equals(StructUtils.GetPath(_options,
            StructUtils.Jt("feature", "test", "active")), true))
        {
            Mode = "test";
        }

        _rootctx.Options = _options;

        // Add features in the resolved order (MakeOptions puts an explicit
        // list order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the transport
        // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        // current, so `test` must be added before them to sit at the base of
        // the chain.
        var featureOpts = Helpers.ToMapAny(StructUtils.GetProp(_options, "feature"))
            ?? new Dictionary<string, object?>();
        var featureOrder = StructUtils.GetPath(_options,
            StructUtils.Jt("__derived__", "featureorder")) as List<object?>
            ?? new List<object?>();
        foreach (var fnameObj in featureOrder)
        {
            var fname = fnameObj as string ?? "";
            var fopts = Helpers.ToMapAny(StructUtils.GetProp(featureOpts, fname));
            if (fopts != null &&
                fopts.TryGetValue("active", out var active) &&
                active is bool ab && ab)
            {
                _utility.FeatureAdd(_rootctx, SdkConfig.MakeFeature(fname));
            }
        }

        // Add extension features.
        if (StructUtils.GetProp(_options, "extend") is List<object?> extList)
        {
            foreach (var f in extList)
            {
                if (f is BaseFeature feat)
                {
                    _utility.FeatureAdd(_rootctx, feat);
                }
            }
        }

        // Initialize features.
        foreach (var f in Features.ToList())
        {
            _utility.FeatureInit(_rootctx, f);
        }

        _utility.FeatureHook(_rootctx, "PostConstruct");
    }

    public Dictionary<string, object?> OptionsMap()
    {
        return StructUtils.Clone(_options) as Dictionary<string, object?>
            ?? new Dictionary<string, object?>();
    }

    public Utility GetUtility()
    {
        return Utility.Copy(_utility);
    }

    public Context GetRootCtx()
    {
        return _rootctx;
    }

    public Dictionary<string, object?> Prepare(Dictionary<string, object?>? fetchargs)
    {
        var utility = _utility;

        fetchargs ??= new Dictionary<string, object?>();

        var ctrl = Helpers.ToMapAny(StructUtils.GetProp(fetchargs, "ctrl"))
            ?? new Dictionary<string, object?>();

        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "prepare",
            ["ctrl"] = ctrl,
        }, _rootctx);

        var options = _options;

        var path = StructUtils.GetProp(fetchargs, "path") as string ?? "";
        var method = StructUtils.GetProp(fetchargs, "method") as string ?? "";
        if (method == "")
        {
            method = "GET";
        }

        var pathParams = Helpers.ToMapAny(StructUtils.GetProp(fetchargs, "params"))
            ?? new Dictionary<string, object?>();
        var query = Helpers.ToMapAny(StructUtils.GetProp(fetchargs, "query"))
            ?? new Dictionary<string, object?>();

        var headers = utility.PrepareHeaders(ctx);

        var basev = StructUtils.GetProp(options, "base") as string ?? "";
        var prefix = StructUtils.GetProp(options, "prefix") as string ?? "";
        var suffix = StructUtils.GetProp(options, "suffix") as string ?? "";

        ctx.Spec = new Spec(new Dictionary<string, object?>
        {
            ["base"] = basev,
            ["prefix"] = prefix,
            ["suffix"] = suffix,
            ["path"] = path,
            ["method"] = method,
            ["params"] = pathParams,
            ["query"] = query,
            ["headers"] = headers,
            ["body"] = StructUtils.GetProp(fetchargs, "body"),
            ["step"] = "start",
        });

        // Merge user-provided headers.
        if (StructUtils.GetProp(fetchargs, "headers") is Dictionary<string, object?> uhm)
        {
            foreach (var kv in uhm)
            {
                ctx.Spec.Headers[kv.Key] = kv.Value;
            }
        }

        utility.PrepareAuth(ctx);

        return utility.MakeFetchDef(ctx);
    }

    public Dictionary<string, object?> Direct(Dictionary<string, object?>? fetchargs)
    {
        var utility = _utility;

        Dictionary<string, object?> fetchdef;
        try
        {
            fetchdef = Prepare(fetchargs);
        }
        catch (Exception err)
        {
            return new Dictionary<string, object?>
            {
                ["ok"] = false,
                ["err"] = err,
            };
        }

        fetchargs ??= new Dictionary<string, object?>();

        var ctrl = Helpers.ToMapAny(StructUtils.GetProp(fetchargs, "ctrl"))
            ?? new Dictionary<string, object?>();

        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "direct",
            ["ctrl"] = ctrl,
        }, _rootctx);

        var url = fetchdef.TryGetValue("url", out var u) ? u as string ?? "" : "";

        object? fetched;
        try
        {
            fetched = utility.Fetcher(ctx, url, fetchdef);
        }
        catch (Exception fetchErr)
        {
            return new Dictionary<string, object?>
            {
                ["ok"] = false,
                ["err"] = fetchErr,
            };
        }

        if (fetched == null)
        {
            return new Dictionary<string, object?>
            {
                ["ok"] = false,
                ["err"] = ctx.MakeError("direct_no_response", "response: undefined"),
            };
        }

        if (fetched is Dictionary<string, object?> fm)
        {
            var status = Helpers.ToInt(StructUtils.GetProp(fm, "status"));
            var headers = StructUtils.GetProp(fm, "headers");

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing - calling json() on an empty body errors.
            var contentLength = "";
            if (headers is Dictionary<string, object?> hm &&
                hm.TryGetValue("content-length", out var cl) && cl != null)
            {
                contentLength = StructUtils.Stringify(cl);
            }
            var noBody = status == 204 || status == 304 || contentLength == "0";

            object? jsonData = null;
            if (!noBody && StructUtils.GetProp(fm, "json") is Func<object?> jf)
            {
                // jf() returns null on parse error in our fetcher.
                jsonData = jf();
            }

            return new Dictionary<string, object?>
            {
                ["ok"] = status >= 200 && status < 300,
                ["status"] = status,
                ["headers"] = headers,
                ["data"] = jsonData,
            };
        }

        return new Dictionary<string, object?>
        {
            ["ok"] = false,
            ["err"] = ctx.MakeError("direct_invalid", "invalid response type"),
        };
    }


    // AccountUpdater returns a AccountUpdater entity bound to this client.
    // Idiomatic usage: client.AccountUpdater().List(null) or
    // client.AccountUpdater().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase AccountUpdater(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.AccountUpdaterEntity(this, entopts);
    }

    // AccountUpdaterSchedule returns a AccountUpdaterSchedule entity bound to this client.
    // Idiomatic usage: client.AccountUpdaterSchedule().List(null) or
    // client.AccountUpdaterSchedule().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase AccountUpdaterSchedule(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.AccountUpdaterScheduleEntity(this, entopts);
    }

    // AccountUpdaterScheduleWithResult returns a AccountUpdaterScheduleWithResult entity bound to this client.
    // Idiomatic usage: client.AccountUpdaterScheduleWithResult().List(null) or
    // client.AccountUpdaterScheduleWithResult().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase AccountUpdaterScheduleWithResult(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.AccountUpdaterScheduleWithResultEntity(this, entopts);
    }

    // AccountUpdaterSubscriptionWithResult returns a AccountUpdaterSubscriptionWithResult entity bound to this client.
    // Idiomatic usage: client.AccountUpdaterSubscriptionWithResult().List(null) or
    // client.AccountUpdaterSubscriptionWithResult().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase AccountUpdaterSubscriptionWithResult(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.AccountUpdaterSubscriptionWithResultEntity(this, entopts);
    }

    // AccountUpdaterUpdate returns a AccountUpdaterUpdate entity bound to this client.
    // Idiomatic usage: client.AccountUpdaterUpdate().List(null) or
    // client.AccountUpdaterUpdate().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase AccountUpdaterUpdate(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.AccountUpdaterUpdateEntity(this, entopts);
    }

    // ApiKey returns a ApiKey entity bound to this client.
    // Idiomatic usage: client.ApiKey().List(null) or
    // client.ApiKey().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ApiKey(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ApiKeyEntity(this, entopts);
    }

    // ApplePayMerchantDetail returns a ApplePayMerchantDetail entity bound to this client.
    // Idiomatic usage: client.ApplePayMerchantDetail().List(null) or
    // client.ApplePayMerchantDetail().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ApplePayMerchantDetail(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ApplePayMerchantDetailEntity(this, entopts);
    }

    // ApplePaySession returns a ApplePaySession entity bound to this client.
    // Idiomatic usage: client.ApplePaySession().List(null) or
    // client.ApplePaySession().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ApplePaySession(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ApplePaySessionEntity(this, entopts);
    }

    // DynamicDescriptor returns a DynamicDescriptor entity bound to this client.
    // Idiomatic usage: client.DynamicDescriptor().List(null) or
    // client.DynamicDescriptor().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase DynamicDescriptor(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.DynamicDescriptorEntity(this, entopts);
    }

    // IFrameCreateInstance returns a IFrameCreateInstance entity bound to this client.
    // Idiomatic usage: client.IFrameCreateInstance().List(null) or
    // client.IFrameCreateInstance().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase IFrameCreateInstance(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.IFrameCreateInstanceEntity(this, entopts);
    }

    // IFrameInstance returns a IFrameInstance entity bound to this client.
    // Idiomatic usage: client.IFrameInstance().List(null) or
    // client.IFrameInstance().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase IFrameInstance(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.IFrameInstanceEntity(this, entopts);
    }

    // Iframe returns a Iframe entity bound to this client.
    // Idiomatic usage: client.Iframe().List(null) or
    // client.Iframe().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase Iframe(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.IframeEntity(this, entopts);
    }

    // Init returns a Init entity bound to this client.
    // Idiomatic usage: client.Init().List(null) or
    // client.Init().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase Init(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.InitEntity(this, entopts);
    }

    // ListApiKeyScopesEntry returns a ListApiKeyScopesEntry entity bound to this client.
    // Idiomatic usage: client.ListApiKeyScopesEntry().List(null) or
    // client.ListApiKeyScopesEntry().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ListApiKeyScopesEntry(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ListApiKeyScopesEntryEntity(this, entopts);
    }

    // PaymentIframe returns a PaymentIframe entity bound to this client.
    // Idiomatic usage: client.PaymentIframe().List(null) or
    // client.PaymentIframe().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase PaymentIframe(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.PaymentIframeEntity(this, entopts);
    }

    // ThreeDSecureAuth returns a ThreeDSecureAuth entity bound to this client.
    // Idiomatic usage: client.ThreeDSecureAuth().List(null) or
    // client.ThreeDSecureAuth().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ThreeDSecureAuth(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ThreeDSecureAuthEntity(this, entopts);
    }

    // ThreeDSecureBrowserInit returns a ThreeDSecureBrowserInit entity bound to this client.
    // Idiomatic usage: client.ThreeDSecureBrowserInit().List(null) or
    // client.ThreeDSecureBrowserInit().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ThreeDSecureBrowserInit(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ThreeDSecureBrowserInitEntity(this, entopts);
    }

    // ThreeDSecureStatus returns a ThreeDSecureStatus entity bound to this client.
    // Idiomatic usage: client.ThreeDSecureStatus().List(null) or
    // client.ThreeDSecureStatus().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase ThreeDSecureStatus(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.ThreeDSecureStatusEntity(this, entopts);
    }

    // TransactionDetail returns a TransactionDetail entity bound to this client.
    // Idiomatic usage: client.TransactionDetail().List(null) or
    // client.TransactionDetail().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase TransactionDetail(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.TransactionDetailEntity(this, entopts);
    }

    // Webhook returns a Webhook entity bound to this client.
    // Idiomatic usage: client.Webhook().List(null) or
    // client.Webhook().Load(new() { ["id"] = ... }).
    public BluefinPayconexEntityBase Webhook(Dictionary<string, object?>? entopts = null)
    {
        return new global::BluefinPayconexSdk.Entity.WebhookEntity(this, entopts);
    }


    public static BluefinPayconexSDK TestSDK(Dictionary<string, object?>? testopts,
        Dictionary<string, object?>? sdkopts)
    {
        sdkopts = StructUtils.Clone(sdkopts ?? new Dictionary<string, object?>())
            as Dictionary<string, object?> ?? new Dictionary<string, object?>();

        testopts = StructUtils.Clone(testopts ?? new Dictionary<string, object?>())
            as Dictionary<string, object?> ?? new Dictionary<string, object?>();
        testopts["active"] = true;

        StructUtils.SetPath(sdkopts, StructUtils.Jt("feature", "test"), testopts);

        var sdk = new BluefinPayconexSDK(sdkopts)
        {
            Mode = "test",
        };

        return sdk;
    }
}
