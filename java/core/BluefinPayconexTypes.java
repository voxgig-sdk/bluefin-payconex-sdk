package voxgig.bluefinpayconexsdk.core;

// Typed reference models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Map<String, Object> / Object) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a boxed (nullable)
// type, so an optional (req:false) key needs no distinct rendering.

import java.util.List;
import java.util.Map;

public final class BluefinPayconexTypes {

  private BluefinPayconexTypes() {}

  public record AccountUpdater() {}

  public record AccountUpdaterRemoveMatch(String account_id, String record_id, String subscription_id) {}

  public record AccountUpdaterSchedule(Boolean enabled, String period_date, String period_id, String response_format, List<Object> token) {}

  public record AccountUpdaterScheduleCreateData(String account_id) {}

  public record AccountUpdaterScheduleWithResult(List<Object> card, String created_at, Boolean enabled, String expiry, String id, Map<String, Object> most_recent_update, String period_date, String period_id, String response_format, List<Object> token, String type, String updated_at) {}

  public record AccountUpdaterScheduleWithResultListMatch(String account_id, String schedule_id) {}

  public record AccountUpdaterScheduleWithResultCreateData(String account_id) {}

  public record AccountUpdaterSubscriptionWithResult(String created_at, Boolean enabled, String id, String period_date, String period_id, String response_format, String template_ref, String updated_at) {}

  public record AccountUpdaterSubscriptionWithResultLoadMatch(String account_id, String subscription_id) {}

  public record AccountUpdaterSubscriptionWithResultCreateData(String account_id, String subscription_id) {}

  public record AccountUpdaterSubscriptionWithResultUpdateData(String account_id, String subscription_id) {}

  public record AccountUpdaterUpdate(String account_updater_schedule_record_id, String format, String id, String new_expiry, String new_token, String old_expiry, String old_token, List<Object> recurring_schedule, String status, String update_id, String updated_at) {}

  public record AccountUpdaterUpdateLoadMatch(String account_id, String id) {}

  public record ApiKey(List<Object> account, Boolean enabled, String expires_at, String expires_in, String id, String label, List<Object> method, List<Object> scope, String secret) {}

  public record ApiKeyLoadMatch(String account_id, String id) {}

  public record ApiKeyListMatch(String account_id) {}

  public record ApiKeyCreateData(String account_id) {}

  public record ApiKeyUpdateData(String account_id, String id) {}

  public record ApiKeyRemoveMatch(String account_id, String id) {}

  public record ApplePayMerchantDetail(List<Object> domain, String merchant_url, String partner_merchant_name, String payconex_account_id) {}

  public record ApplePayMerchantDetailListMatch(Long account_id) {}

  public record ApplePayMerchantDetailCreateData(Long account_id) {}

  public record ApplePaySession(String display_name, String domain_name, Long epoch_timestamp, Long expires_at, String merchant_identifier, String merchant_session_identifier, Long nonce, String operational_analytics_identifier, String referrer, Long retry, String signature) {}

  public record ApplePaySessionCreateData(Long account_id) {}

  public record DynamicDescriptor(String city, String descriptor, String id, String name, String state) {}

  public record DynamicDescriptorLoadMatch(String account_id, String id) {}

  public record DynamicDescriptorListMatch(String account_id) {}

  public record DynamicDescriptorCreateData(String account_id) {}

  public record DynamicDescriptorUpdateData(String account_id, String id) {}

  public record DynamicDescriptorRemoveMatch(String account_id, String id) {}

  public record IFrameCreateInstance(String amount, String currency, Map<String, Object> customer, Boolean initialize_transaction, String label, String language, String reference, Double timeout, List<Object> token) {}

  public record IFrameCreateInstanceCreateData(String account_id, String payment_iframe_id) {}

  public record IFrameInstance() {}

  public record IFrameInstanceLoadMatch(String account_id, String id, String payment_iframe_id) {}

  public record Iframe(Map<String, Object> ach_setting, List<Object> allowed_parent_domain, List<Object> allowed_payment_method, Map<String, Object> card_setting, Map<String, Object> click_to_pay_setting, String currency, String id, String label, String language, Double timeout) {}

  public record IframeLoadMatch(String account_id, String iframe_id) {}

  public record IframeListMatch(String account_id) {}

  public record IframeCreateData(String account_id) {}

  public record IframeUpdateData(String account_id, String iframe_id) {}

  public record Init(Map<String, Object> customer, String description, List<Object> item, Map<String, Object> level2, Map<String, Object> level3, Map<String, Object> shipping_address, Map<String, Object> trace) {}

  public record InitCreateData(String account_id) {}

  public record ListApiKeyScopesEntry(String category, String description, Boolean enabled, Long level, String scope) {}

  public record ListApiKeyScopesEntryListMatch(String category, String description, Boolean enabled, Long level, String scope) {}

  public record PaymentIframe() {}

  public record PaymentIframeRemoveMatch(String account_id, String id) {}

  public record ThreeDSecureAuth(Map<String, Object> browser, Map<String, Object> card, Map<String, Object> challenge, Map<String, Object> customer, Map<String, Object> purchase, String server_transaction_id, Map<String, Object> shipping, String status, String three_d_secure_challenge_indicator, String three_d_secure_id, Map<String, Object> trace) {}

  public record ThreeDSecureAuthCreateData(String account_id) {}

  public record ThreeDSecureBrowserInit(String acs_result_url, String acs_url, String cvv, String expiry, String pan, String payment_details_reference, String server_transaction_id, String status, String three_d_secure_data, String three_d_secure_id) {}

  public record ThreeDSecureBrowserInitCreateData(String account_id) {}

  public record ThreeDSecureStatus(Map<String, Object> error, Map<String, Object> info, String server_transaction_id, String status, Map<String, Object> three_d_secure, String three_d_secure_id) {}

  public record ThreeDSecureStatusLoadMatch(String account_id) {}

  public record TransactionDetail(Map<String, Object> amount, Map<String, Object> auth, Map<String, Object> card, Map<String, Object> customer, String description, String id, List<Object> item, Map<String, Object> level2, Map<String, Object> level3, Map<String, Object> override, Map<String, Object> shipping_address, String status, String timestamp, Map<String, Object> trace) {}

  public record TransactionDetailLoadMatch(String account_id, String transaction_id) {}

  public record TransactionDetailUpdateData(String account_id, String transaction_id) {}

  public record Webhook(String event, String id, String url) {}

  public record WebhookLoadMatch(String account_id, String id) {}

  public record WebhookListMatch(String account_id) {}

  public record WebhookCreateData(String account_id) {}

  public record WebhookUpdateData(String account_id, String id) {}

  public record WebhookRemoveMatch(String account_id, String id) {}

}
