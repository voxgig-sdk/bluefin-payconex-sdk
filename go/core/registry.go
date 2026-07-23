package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewAccountUpdaterEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewAccountUpdaterScheduleEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewAccountUpdaterScheduleWithResultEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewAccountUpdaterSubscriptionWithResultEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewAccountUpdaterUpdateEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewApiKeyEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewApplePayMerchantDetailEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewApplePaySessionEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewDynamicDescriptorEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewIFrameCreateInstanceEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewIFrameInstanceEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewIframeEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewInitEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewListApiKeyScopesEntryEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewPaymentIframeEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewThreeDSecureAuthEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewThreeDSecureBrowserInitEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewThreeDSecureStatusEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewTransactionDetailEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

var NewWebhookEntityFunc func(client *BluefinPayconexSDK, entopts map[string]any) BluefinPayconexEntity

