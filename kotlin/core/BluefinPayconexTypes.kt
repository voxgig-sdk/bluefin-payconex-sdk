package voxgig.bluefinpayconexsdk.core

// Typed reference models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These types are documentation/DX reference shapes ONLY. The SDK ops take and
// return the loose object model (MutableMap<String, Any?> / Any?) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a nullable type, so
// an optional (req:false) key needs no distinct rendering.

@Suppress("unused")
object BluefinPayconexTypes {

  class AccountUpdater

  data class AccountUpdaterRemoveMatch(val account_id: String?, val record_id: String?, val subscription_id: String?)

  data class AccountUpdaterSchedule(val enabled: Boolean?, val period_date: String?, val period_id: String?, val response_format: String?, val token: List<Any?>?)

  data class AccountUpdaterScheduleCreateData(val account_id: String?)

  data class AccountUpdaterScheduleWithResult(val card: List<Any?>?, val created_at: String?, val enabled: Boolean?, val expiry: String?, val id: String?, val most_recent_update: Map<String, Any?>?, val period_date: String?, val period_id: String?, val response_format: String?, val token: List<Any?>?, val type: String?, val updated_at: String?)

  data class AccountUpdaterScheduleWithResultListMatch(val account_id: String?, val schedule_id: String?)

  data class AccountUpdaterScheduleWithResultCreateData(val account_id: String?)

  data class AccountUpdaterSubscriptionWithResult(val created_at: String?, val enabled: Boolean?, val id: String?, val period_date: String?, val period_id: String?, val record: List<Any?>?, val response_format: String?, val template_ref: String?, val updated_at: String?)

  data class AccountUpdaterSubscriptionWithResultLoadMatch(val account_id: String?, val subscription_id: String?)

  data class AccountUpdaterSubscriptionWithResultCreateData(val account_id: String?, val subscription_id: String?)

  data class AccountUpdaterSubscriptionWithResultUpdateData(val account_id: String?, val subscription_id: String?)

  data class AccountUpdaterUpdate(val account_updater_schedule_record_id: String?, val format: String?, val id: String?, val new_expiry: String?, val new_token: String?, val old_expiry: String?, val old_token: String?, val recurring_schedule: List<Any?>?, val status: String?, val update_id: String?, val updated_at: String?)

  data class AccountUpdaterUpdateLoadMatch(val account_id: String?, val id: String?)

  data class ApiKey(val account: List<Any?>?, val enabled: Boolean?, val expires_at: String?, val expires_in: String?, val id: String?, val label: String?, val method: List<Any?>?, val scope: List<Any?>?, val secret: String?)

  data class ApiKeyLoadMatch(val account_id: String?, val id: String?)

  data class ApiKeyListMatch(val account_id: String?)

  data class ApiKeyCreateData(val account_id: String?)

  data class ApiKeyUpdateData(val account_id: String?, val id: String?)

  data class ApiKeyRemoveMatch(val account_id: String?, val id: String?)

  data class ApplePayMerchantDetail(val domain: List<Any?>?, val merchant_url: String?, val partner_merchant_name: String?, val payconex_account_id: String?)

  data class ApplePayMerchantDetailListMatch(val account_id: Long?)

  data class ApplePayMerchantDetailCreateData(val account_id: Long?)

  data class ApplePaySession(val display_name: String?, val domain_name: String?, val epoch_timestamp: Long?, val expires_at: Long?, val merchant_identifier: String?, val merchant_session_identifier: String?, val nonce: Long?, val operational_analytics_identifier: String?, val referrer: String?, val retry: Long?, val signature: String?)

  data class ApplePaySessionCreateData(val account_id: Long?)

  data class DynamicDescriptor(val city: String?, val descriptor: String?, val id: String?, val name: String?, val state: String?)

  data class DynamicDescriptorLoadMatch(val account_id: String?, val id: String?)

  data class DynamicDescriptorListMatch(val account_id: String?)

  data class DynamicDescriptorCreateData(val account_id: String?)

  data class DynamicDescriptorUpdateData(val account_id: String?, val id: String?)

  data class DynamicDescriptorRemoveMatch(val account_id: String?, val id: String?)

  data class IFrameCreateInstance(val amount: String?, val currency: String?, val customer: Map<String, Any?>?, val initialize_transaction: Boolean?, val label: String?, val language: String?, val reference: String?, val timeout: Double?, val token: List<Any?>?)

  data class IFrameCreateInstanceCreateData(val account_id: String?, val payment_iframe_id: String?)

  class IFrameInstance

  data class IFrameInstanceLoadMatch(val account_id: String?, val id: String?, val payment_iframe_id: String?)

  data class Iframe(val ach_setting: Map<String, Any?>?, val allowed_parent_domain: List<Any?>?, val allowed_payment_method: List<Any?>?, val card_setting: Map<String, Any?>?, val click_to_pay_setting: Map<String, Any?>?, val currency: String?, val id: String?, val label: String?, val language: String?, val timeout: Double?)

  data class IframeLoadMatch(val account_id: String?, val iframe_id: String?)

  data class IframeListMatch(val account_id: String?)

  data class IframeCreateData(val account_id: String?)

  data class IframeUpdateData(val account_id: String?, val iframe_id: String?)

  data class Init(val customer: Map<String, Any?>?, val description: String?, val item: List<Any?>?, val level2: Map<String, Any?>?, val level3: Map<String, Any?>?, val shipping_address: Map<String, Any?>?, val trace: Map<String, Any?>?)

  data class InitCreateData(val account_id: String?)

  data class ListApiKeyScopesEntry(val category: String?, val description: String?, val enabled: Boolean?, val level: Long?, val scope: String?)

  data class ListApiKeyScopesEntryListMatch(val category: String?, val description: String?, val enabled: Boolean?, val level: Long?, val scope: String?)

  class PaymentIframe

  data class PaymentIframeRemoveMatch(val account_id: String?, val id: String?)

  data class ThreeDSecureAuth(val browser: Map<String, Any?>?, val card: Map<String, Any?>?, val challenge: Map<String, Any?>?, val customer: Map<String, Any?>?, val purchase: Map<String, Any?>?, val server_transaction_id: String?, val shipping: Map<String, Any?>?, val status: String?, val three_d_secure_challenge_indicator: String?, val three_d_secure_id: String?, val trace: Map<String, Any?>?)

  data class ThreeDSecureAuthCreateData(val account_id: String?)

  data class ThreeDSecureBrowserInit(val acs_result_url: String?, val acs_url: String?, val cvv: String?, val expiry: String?, val pan: String?, val payment_details_reference: String?, val server_transaction_id: String?, val status: String?, val three_d_secure_data: String?, val three_d_secure_id: String?)

  data class ThreeDSecureBrowserInitCreateData(val account_id: String?)

  data class ThreeDSecureStatus(val error: Map<String, Any?>?, val info: Map<String, Any?>?, val server_transaction_id: String?, val status: String?, val three_d_secure: Map<String, Any?>?, val three_d_secure_id: String?)

  data class ThreeDSecureStatusLoadMatch(val account_id: String?)

  data class TransactionDetail(val amount: Map<String, Any?>?, val auth: Map<String, Any?>?, val card: Map<String, Any?>?, val customer: Map<String, Any?>?, val description: String?, val id: String?, val item: List<Any?>?, val level2: Map<String, Any?>?, val level3: Map<String, Any?>?, val override: Map<String, Any?>?, val shipping_address: Map<String, Any?>?, val status: String?, val timestamp: String?, val trace: Map<String, Any?>?)

  data class TransactionDetailLoadMatch(val account_id: String?, val transaction_id: String?)

  data class TransactionDetailUpdateData(val account_id: String?, val transaction_id: String?)

  data class Webhook(val event: String?, val id: String?, val url: String?)

  data class WebhookLoadMatch(val account_id: String?, val id: String?)

  data class WebhookListMatch(val account_id: String?)

  data class WebhookCreateData(val account_id: String?)

  data class WebhookUpdateData(val account_id: String?, val id: String?)

  data class WebhookRemoveMatch(val account_id: String?, val id: String?)

}
