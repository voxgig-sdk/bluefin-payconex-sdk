package voxgigbluefinpayconexsdk

import (
	"github.com/voxgig-sdk/bluefin-payconex-sdk/go/core"
	"github.com/voxgig-sdk/bluefin-payconex-sdk/go/entity"
	"github.com/voxgig-sdk/bluefin-payconex-sdk/go/feature"
	_ "github.com/voxgig-sdk/bluefin-payconex-sdk/go/utility"
)

// Type aliases preserve external API.
type BluefinPayconexSDK = core.BluefinPayconexSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type BluefinPayconexEntity = core.BluefinPayconexEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type BluefinPayconexError = core.BluefinPayconexError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAccountUpdaterEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewAccountUpdaterEntity(client, entopts)
	}
	core.NewAccountUpdaterScheduleEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewAccountUpdaterScheduleEntity(client, entopts)
	}
	core.NewAccountUpdaterScheduleWithResultEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewAccountUpdaterScheduleWithResultEntity(client, entopts)
	}
	core.NewAccountUpdaterSubscriptionWithResultEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewAccountUpdaterSubscriptionWithResultEntity(client, entopts)
	}
	core.NewAccountUpdaterUpdateEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewAccountUpdaterUpdateEntity(client, entopts)
	}
	core.NewApiKeyEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewApiKeyEntity(client, entopts)
	}
	core.NewApplePayMerchantDetailEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewApplePayMerchantDetailEntity(client, entopts)
	}
	core.NewApplePaySessionEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewApplePaySessionEntity(client, entopts)
	}
	core.NewDynamicDescriptorEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewDynamicDescriptorEntity(client, entopts)
	}
	core.NewIFrameCreateInstanceEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewIFrameCreateInstanceEntity(client, entopts)
	}
	core.NewIFrameInstanceEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewIFrameInstanceEntity(client, entopts)
	}
	core.NewIframeEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewIframeEntity(client, entopts)
	}
	core.NewInitEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewInitEntity(client, entopts)
	}
	core.NewListApiKeyScopesEntryEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewListApiKeyScopesEntryEntity(client, entopts)
	}
	core.NewPaymentIframeEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewPaymentIframeEntity(client, entopts)
	}
	core.NewThreeDSecureAuthEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewThreeDSecureAuthEntity(client, entopts)
	}
	core.NewThreeDSecureBrowserInitEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewThreeDSecureBrowserInitEntity(client, entopts)
	}
	core.NewThreeDSecureStatusEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewThreeDSecureStatusEntity(client, entopts)
	}
	core.NewTransactionDetailEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewTransactionDetailEntity(client, entopts)
	}
	core.NewWebhookEntityFunc = func(client *core.BluefinPayconexSDK, entopts map[string]any) core.BluefinPayconexEntity {
		return entity.NewWebhookEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewBluefinPayconexSDK = core.NewBluefinPayconexSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewBluefinPayconexSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *BluefinPayconexSDK  { return NewBluefinPayconexSDK(nil) }
func Test() *BluefinPayconexSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
