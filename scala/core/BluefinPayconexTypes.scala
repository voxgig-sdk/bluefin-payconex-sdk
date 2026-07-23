package voxgig.bluefinpayconexsdk.core

// Typed reference models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These case classes are documentation/DX reference shapes ONLY. The SDK ops
// take and return the loose object model (java.util.Map[String, Object] /
// Object) at runtime, so these types are not wired into the op signatures —
// use them to describe a payload before converting it to a map. Every
// component is a boxed (nullable) type, so an optional (req:false) key needs
// no distinct rendering.

object BluefinPayconexTypes {

  final case class AccountUpdater()

  final case class AccountUpdaterRemoveMatch(account_id: String, record_id: String, subscription_id: String)

  final case class AccountUpdaterSchedule(enabled: java.lang.Boolean, period_date: String, period_id: String, response_format: String, token: java.util.List[Object])

  final case class AccountUpdaterScheduleCreateData(account_id: String)

  final case class AccountUpdaterScheduleWithResult(card: java.util.List[Object], created_at: String, enabled: java.lang.Boolean, expiry: String, id: String, most_recent_update: java.util.Map[String, Object], period_date: String, period_id: String, response_format: String, token: java.util.List[Object], updated_at: String)

  final case class AccountUpdaterScheduleWithResultListMatch(account_id: String, schedule_id: String)

  final case class AccountUpdaterScheduleWithResultCreateData(account_id: String)

  final case class AccountUpdaterSubscriptionWithResult(created_at: String, enabled: java.lang.Boolean, id: String, period_date: String, period_id: String, record: java.util.List[Object], response_format: String, template_ref: String, updated_at: String)

  final case class AccountUpdaterSubscriptionWithResultLoadMatch(account_id: String, subscription_id: String)

  final case class AccountUpdaterSubscriptionWithResultCreateData(account_id: String, subscription_id: String)

  final case class AccountUpdaterSubscriptionWithResultUpdateData(account_id: String, subscription_id: String)

  final case class AccountUpdaterUpdate(account_updater_schedule_record_id: String, format: String, id: String, new_expiry: String, new_token: String, old_expiry: String, old_token: String, recurring_schedule: java.util.List[Object], status: String, update_id: String, updated_at: String)

  final case class AccountUpdaterUpdateLoadMatch(account_id: String, id: String)

  final case class ApiKey(account: java.util.List[Object], enabled: java.lang.Boolean, expires_at: String, expires_in: String, id: String, label: String, method: java.util.List[Object], scope: java.util.List[Object], secret: String)

  final case class ApiKeyLoadMatch(account_id: String, id: String)

  final case class ApiKeyListMatch(account_id: String)

  final case class ApiKeyCreateData(account_id: String)

  final case class ApiKeyUpdateData(account_id: String, id: String)

  final case class ApiKeyRemoveMatch(account_id: String, id: String)

  final case class ApplePayMerchantDetail(domain: java.util.List[Object], merchant_url: String, partner_merchant_name: String, payconex_account_id: String)

  final case class ApplePayMerchantDetailListMatch(account_id: java.lang.Long)

  final case class ApplePayMerchantDetailCreateData(account_id: java.lang.Long)

  final case class ApplePaySession(display_name: String, domain_name: String, epoch_timestamp: java.lang.Long, expires_at: java.lang.Long, merchant_identifier: String, merchant_session_identifier: String, nonce: java.lang.Long, operational_analytics_identifier: String, referrer: String, retry: java.lang.Long, signature: String)

  final case class ApplePaySessionCreateData(account_id: java.lang.Long)

  final case class DynamicDescriptor(city: String, descriptor: String, id: String, name: String, state: String)

  final case class DynamicDescriptorLoadMatch(account_id: String, id: String)

  final case class DynamicDescriptorListMatch(account_id: String)

  final case class DynamicDescriptorCreateData(account_id: String)

  final case class DynamicDescriptorUpdateData(account_id: String, id: String)

  final case class DynamicDescriptorRemoveMatch(account_id: String, id: String)

  final case class IFrameCreateInstance(amount: String, currency: String, customer: java.util.Map[String, Object], initialize_transaction: java.lang.Boolean, label: String, language: String, reference: String, timeout: java.lang.Double, token: java.util.List[Object])

  final case class IFrameCreateInstanceCreateData(account_id: String, payment_iframe_id: String)

  final case class IFrameInstance()

  final case class IFrameInstanceLoadMatch(account_id: String, id: String, payment_iframe_id: String)

  final case class Iframe(ach_setting: java.util.Map[String, Object], allowed_parent_domain: java.util.List[Object], allowed_payment_method: java.util.List[Object], card_setting: java.util.Map[String, Object], click_to_pay_setting: java.util.Map[String, Object], currency: String, id: String, label: String, language: String, timeout: java.lang.Double)

  final case class IframeLoadMatch(account_id: String, iframe_id: String)

  final case class IframeListMatch(account_id: String)

  final case class IframeCreateData(account_id: String)

  final case class IframeUpdateData(account_id: String, iframe_id: String)

  final case class Init(customer: java.util.Map[String, Object], description: String, item: java.util.List[Object], level2: java.util.Map[String, Object], level3: java.util.Map[String, Object], shipping_address: java.util.Map[String, Object], trace: java.util.Map[String, Object])

  final case class InitCreateData(account_id: String)

  final case class ListApiKeyScopesEntry(category: String, description: String, enabled: java.lang.Boolean, level: java.lang.Long, scope: String)

  final case class ListApiKeyScopesEntryListMatch(category: String, description: String, enabled: java.lang.Boolean, level: java.lang.Long, scope: String)

  final case class PaymentIframe()

  final case class PaymentIframeRemoveMatch(account_id: String, id: String)

  final case class ThreeDSecureAuth(browser: java.util.Map[String, Object], card: java.util.Map[String, Object], challenge: java.util.Map[String, Object], customer: java.util.Map[String, Object], purchase: java.util.Map[String, Object], server_transaction_id: String, shipping: java.util.Map[String, Object], status: String, three_d_secure_challenge_indicator: String, three_d_secure_id: String, trace: java.util.Map[String, Object])

  final case class ThreeDSecureAuthCreateData(account_id: String)

  final case class ThreeDSecureBrowserInit(acs_result_url: String, acs_url: String, cvv: String, expiry: String, pan: String, payment_details_reference: String, server_transaction_id: String, status: String, three_d_secure_data: String, three_d_secure_id: String)

  final case class ThreeDSecureBrowserInitCreateData(account_id: String)

  final case class ThreeDSecureStatus(error: java.util.Map[String, Object], info: java.util.Map[String, Object], server_transaction_id: String, status: String, three_d_secure: java.util.Map[String, Object], three_d_secure_id: String)

  final case class ThreeDSecureStatusLoadMatch(account_id: String)

  final case class TransactionDetail(amount: java.util.Map[String, Object], auth: java.util.Map[String, Object], card: java.util.Map[String, Object], customer: java.util.Map[String, Object], description: String, id: String, item: java.util.List[Object], level2: java.util.Map[String, Object], level3: java.util.Map[String, Object], shipping_address: java.util.Map[String, Object], status: String, timestamp: String, trace: java.util.Map[String, Object])

  final case class TransactionDetailLoadMatch(account_id: String, transaction_id: String)

  final case class TransactionDetailUpdateData(account_id: String, transaction_id: String)

  final case class Webhook(event: String, id: String, url: String)

  final case class WebhookLoadMatch(account_id: String, id: String)

  final case class WebhookListMatch(account_id: String)

  final case class WebhookCreateData(account_id: String)

  final case class WebhookUpdateData(account_id: String, id: String)

  final case class WebhookRemoveMatch(account_id: String, id: String)

}
