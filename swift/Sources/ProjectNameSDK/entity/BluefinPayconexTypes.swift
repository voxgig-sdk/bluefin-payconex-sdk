// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.

import Foundation

/// AccountUpdater is the typed data model for the account_updater entity.
public struct AccountUpdater {
}

/// AccountUpdaterRemoveMatch is the typed request payload for AccountUpdater.remove.
public struct AccountUpdaterRemoveMatch {
  public var accountId: String
  public var recordId: String?
  public var subscriptionId: String
}

/// AccountUpdaterSchedule is the typed data model for the account_updater_schedule entity.
public struct AccountUpdaterSchedule {
  public var enabled: Bool?
  public var periodDate: String?
  public var periodId: String
  public var responseFormat: String?
  public var token: [Value]
}

/// AccountUpdaterScheduleCreateData is the typed request payload for AccountUpdaterSchedule.create.
public struct AccountUpdaterScheduleCreateData {
  public var accountId: String
}

/// AccountUpdaterScheduleWithResult is the typed data model for the account_updater_schedule_with_result entity.
public struct AccountUpdaterScheduleWithResult {
  public var card: [Value]
  public var createdAt: String
  public var enabled: Bool?
  public var expiry: String?
  public var id: String
  public var mostRecentUpdate: VMap?
  public var periodDate: String?
  public var periodId: String
  public var responseFormat: String?
  public var token: [Value]
  public var type: String
  public var updatedAt: String
}

/// AccountUpdaterScheduleWithResultListMatch is the typed request payload for AccountUpdaterScheduleWithResult.list.
public struct AccountUpdaterScheduleWithResultListMatch {
  public var accountId: String
  public var scheduleId: String
}

/// AccountUpdaterScheduleWithResultCreateData is the typed request payload for AccountUpdaterScheduleWithResult.create.
public struct AccountUpdaterScheduleWithResultCreateData {
  public var accountId: String
}

/// AccountUpdaterSubscriptionWithResult is the typed data model for the account_updater_subscription_with_result entity.
public struct AccountUpdaterSubscriptionWithResult {
  public var createdAt: String?
  public var enabled: Bool?
  public var id: String?
  public var periodDate: String?
  public var periodId: String?
  public var record: [Value]?
  public var responseFormat: String?
  public var templateRef: String?
  public var updatedAt: String?
}

/// AccountUpdaterSubscriptionWithResultLoadMatch is the typed request payload for AccountUpdaterSubscriptionWithResult.load.
public struct AccountUpdaterSubscriptionWithResultLoadMatch {
  public var accountId: String
  public var subscriptionId: String
}

/// AccountUpdaterSubscriptionWithResultCreateData is the typed request payload for AccountUpdaterSubscriptionWithResult.create.
public struct AccountUpdaterSubscriptionWithResultCreateData {
  public var accountId: String
  public var subscriptionId: String
}

/// AccountUpdaterSubscriptionWithResultUpdateData is the typed request payload for AccountUpdaterSubscriptionWithResult.update.
public struct AccountUpdaterSubscriptionWithResultUpdateData {
  public var accountId: String
  public var subscriptionId: String
}

/// AccountUpdaterUpdate is the typed data model for the account_updater_update entity.
public struct AccountUpdaterUpdate {
  public var accountUpdaterScheduleRecordId: String?
  public var format: String?
  public var id: String?
  public var newExpiry: String?
  public var newToken: String?
  public var oldExpiry: String?
  public var oldToken: String?
  public var recurringSchedule: [Value]?
  public var status: String?
  public var updateId: String?
  public var updatedAt: String?
}

/// AccountUpdaterUpdateLoadMatch is the typed request payload for AccountUpdaterUpdate.load.
public struct AccountUpdaterUpdateLoadMatch {
  public var accountId: String
  public var id: String
}

/// ApiKey is the typed data model for the api_key entity.
public struct ApiKey {
  public var account: [Value]?
  public var enabled: Bool?
  public var expiresAt: String?
  public var expiresIn: String?
  public var id: String?
  public var label: String?
  public var method: [Value]?
  public var scope: [Value]?
  public var secret: String?
}

/// ApiKeyLoadMatch is the typed request payload for ApiKey.load.
public struct ApiKeyLoadMatch {
  public var accountId: String
  public var id: String
}

/// ApiKeyListMatch is the typed request payload for ApiKey.list.
public struct ApiKeyListMatch {
  public var accountId: String
}

/// ApiKeyCreateData is the typed request payload for ApiKey.create.
public struct ApiKeyCreateData {
  public var accountId: String
}

/// ApiKeyUpdateData is the typed request payload for ApiKey.update.
public struct ApiKeyUpdateData {
  public var accountId: String
  public var id: String
}

/// ApiKeyRemoveMatch is the typed request payload for ApiKey.remove.
public struct ApiKeyRemoveMatch {
  public var accountId: String
  public var id: String
}

/// ApplePayMerchantDetail is the typed data model for the apple_pay_merchant_detail entity.
public struct ApplePayMerchantDetail {
  public var domain: [Value]
  public var merchantUrl: String
  public var partnerMerchantName: String?
  public var payconexAccountId: String
}

/// ApplePayMerchantDetailListMatch is the typed request payload for ApplePayMerchantDetail.list.
public struct ApplePayMerchantDetailListMatch {
  public var accountId: Int
}

/// ApplePayMerchantDetailCreateData is the typed request payload for ApplePayMerchantDetail.create.
public struct ApplePayMerchantDetailCreateData {
  public var accountId: Int
}

/// ApplePaySession is the typed data model for the apple_pay_session entity.
public struct ApplePaySession {
  public var displayName: String?
  public var domainName: String?
  public var epochTimestamp: Int?
  public var expiresAt: Int?
  public var merchantIdentifier: String?
  public var merchantSessionIdentifier: String?
  public var nonce: Int?
  public var operationalAnalyticsIdentifier: String?
  public var referrer: String
  public var retry: Int?
  public var signature: String?
}

/// ApplePaySessionCreateData is the typed request payload for ApplePaySession.create.
public struct ApplePaySessionCreateData {
  public var accountId: Int
}

/// DynamicDescriptor is the typed data model for the dynamic_descriptor entity.
public struct DynamicDescriptor {
  public var city: String?
  public var descriptor: String?
  public var id: String?
  public var name: String?
  public var state: String?
}

/// DynamicDescriptorLoadMatch is the typed request payload for DynamicDescriptor.load.
public struct DynamicDescriptorLoadMatch {
  public var accountId: String
  public var id: String
}

/// DynamicDescriptorListMatch is the typed request payload for DynamicDescriptor.list.
public struct DynamicDescriptorListMatch {
  public var accountId: String
}

/// DynamicDescriptorCreateData is the typed request payload for DynamicDescriptor.create.
public struct DynamicDescriptorCreateData {
  public var accountId: String
}

/// DynamicDescriptorUpdateData is the typed request payload for DynamicDescriptor.update.
public struct DynamicDescriptorUpdateData {
  public var accountId: String
  public var id: String
}

/// DynamicDescriptorRemoveMatch is the typed request payload for DynamicDescriptor.remove.
public struct DynamicDescriptorRemoveMatch {
  public var accountId: String
  public var id: String
}

/// IFrameCreateInstance is the typed data model for the i_frame_create_instance entity.
public struct IFrameCreateInstance {
  public var amount: String?
  public var currency: String?
  public var customer: VMap?
  public var initializeTransaction: Bool?
  public var label: String
  public var language: String?
  public var reference: String?
  public var timeout: Double?
  public var token: [Value]?
}

/// IFrameCreateInstanceCreateData is the typed request payload for IFrameCreateInstance.create.
public struct IFrameCreateInstanceCreateData {
  public var accountId: String
  public var paymentIframeId: String
}

/// IFrameInstance is the typed data model for the i_frame_instance entity.
public struct IFrameInstance {
}

/// IFrameInstanceLoadMatch is the typed request payload for IFrameInstance.load.
public struct IFrameInstanceLoadMatch {
  public var accountId: String
  public var id: String
  public var paymentIframeId: String
}

/// Iframe is the typed data model for the iframe entity.
public struct Iframe {
  public var achSetting: VMap?
  public var allowedParentDomain: [Value]
  public var allowedPaymentMethod: [Value]
  public var cardSetting: VMap?
  public var clickToPaySetting: VMap?
  public var currency: String?
  public var id: String?
  public var label: String
  public var language: String?
  public var timeout: Double?
}

/// IframeLoadMatch is the typed request payload for Iframe.load.
public struct IframeLoadMatch {
  public var accountId: String
  public var iframeId: String
}

/// IframeListMatch is the typed request payload for Iframe.list.
public struct IframeListMatch {
  public var accountId: String
}

/// IframeCreateData is the typed request payload for Iframe.create.
public struct IframeCreateData {
  public var accountId: String
}

/// IframeUpdateData is the typed request payload for Iframe.update.
public struct IframeUpdateData {
  public var accountId: String
  public var iframeId: String
}

/// Init is the typed data model for the init entity.
public struct Init {
  public var customer: VMap?
  public var description: String?
  public var item: [Value]?
  public var level2: VMap?
  public var level3: VMap?
  public var shippingAddress: VMap
  public var trace: VMap?
}

/// InitCreateData is the typed request payload for Init.create.
public struct InitCreateData {
  public var accountId: String
}

/// ListApiKeyScopesEntry is the typed data model for the list_api_key_scopes_entry entity.
public struct ListApiKeyScopesEntry {
  public var category: String?
  public var description: String?
  public var enabled: Bool?
  public var level: Int?
  public var scope: String?
}

/// ListApiKeyScopesEntryListMatch is the typed request payload for ListApiKeyScopesEntry.list.
public struct ListApiKeyScopesEntryListMatch {
  public var category: String?
  public var description: String?
  public var enabled: Bool?
  public var level: Int?
  public var scope: String?
}

/// PaymentIframe is the typed data model for the payment_iframe entity.
public struct PaymentIframe {
}

/// PaymentIframeRemoveMatch is the typed request payload for PaymentIframe.remove.
public struct PaymentIframeRemoveMatch {
  public var accountId: String
  public var id: String
}

/// ThreeDSecureAuth is the typed data model for the three_d_secure_auth entity.
public struct ThreeDSecureAuth {
  public var browser: VMap
  public var card: VMap
  public var challenge: VMap?
  public var customer: VMap?
  public var purchase: VMap
  public var serverTransactionId: String?
  public var shipping: VMap
  public var status: String?
  public var threeDSecureChallengeIndicator: String?
  public var threeDSecureId: String?
  public var trace: VMap?
}

/// ThreeDSecureAuthCreateData is the typed request payload for ThreeDSecureAuth.create.
public struct ThreeDSecureAuthCreateData {
  public var 3DId: String
  public var accountId: String
}

/// ThreeDSecureBrowserInit is the typed data model for the three_d_secure_browser_init entity.
public struct ThreeDSecureBrowserInit {
  public var acsResultUrl: String?
  public var acsUrl: String?
  public var cvv: String?
  public var expiry: String
  public var pan: String
  public var paymentDetailsReference: String?
  public var serverTransactionId: String?
  public var status: String?
  public var threeDSecureData: String?
  public var threeDSecureId: String?
}

/// ThreeDSecureBrowserInitCreateData is the typed request payload for ThreeDSecureBrowserInit.create.
public struct ThreeDSecureBrowserInitCreateData {
  public var accountId: String
}

/// ThreeDSecureStatus is the typed data model for the three_d_secure_status entity.
public struct ThreeDSecureStatus {
  public var error: VMap?
  public var info: VMap?
  public var serverTransactionId: String?
  public var status: String?
  public var threeDSecure: VMap?
  public var threeDSecureId: String?
}

/// ThreeDSecureStatusLoadMatch is the typed request payload for ThreeDSecureStatus.load.
public struct ThreeDSecureStatusLoadMatch {
  public var 3DId: String
  public var accountId: String
}

/// TransactionDetail is the typed data model for the transaction_detail entity.
public struct TransactionDetail {
  public var amount: VMap
  public var auth: VMap
  public var card: VMap?
  public var customer: VMap?
  public var description: String?
  public var id: String?
  public var item: [Value]?
  public var level2: VMap?
  public var level3: VMap?
  public var override: VMap?
  public var shippingAddress: VMap
  public var status: String
  public var timestamp: String?
  public var trace: VMap?
}

/// TransactionDetailLoadMatch is the typed request payload for TransactionDetail.load.
public struct TransactionDetailLoadMatch {
  public var accountId: String
  public var transactionId: String
}

/// TransactionDetailUpdateData is the typed request payload for TransactionDetail.update.
public struct TransactionDetailUpdateData {
  public var accountId: String
  public var transactionId: String
}

/// Webhook is the typed data model for the webhook entity.
public struct Webhook {
  public var event: String
  public var id: String?
  public var url: String
}

/// WebhookLoadMatch is the typed request payload for Webhook.load.
public struct WebhookLoadMatch {
  public var accountId: String
  public var id: String
}

/// WebhookListMatch is the typed request payload for Webhook.list.
public struct WebhookListMatch {
  public var accountId: String
}

/// WebhookCreateData is the typed request payload for Webhook.create.
public struct WebhookCreateData {
  public var accountId: String
}

/// WebhookUpdateData is the typed request payload for Webhook.update.
public struct WebhookUpdateData {
  public var accountId: String
  public var id: String
}

/// WebhookRemoveMatch is the typed request payload for Webhook.remove.
public struct WebhookRemoveMatch {
  public var accountId: String
  public var id: String
}

