// Typed reference models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Dictionary<string, object?> / object?) at
// runtime, so these types are not wired into the op signatures — use them to
// describe a payload before converting it to a dictionary. Optional (req:false)
// keys are modelled as nullable properties.

namespace BluefinPayconexSdk.Types;

public record AccountUpdater();

public record AccountUpdaterRemoveMatch
{
    public string account_id { get; init; }
    public string? record_id { get; init; }
    public string subscription_id { get; init; }
}

public record AccountUpdaterSchedule
{
    public bool? enabled { get; init; }
    public string? period_date { get; init; }
    public string period_id { get; init; }
    public string? response_format { get; init; }
    public List<object?> token { get; init; }
}

public record AccountUpdaterScheduleCreateData
{
    public string account_id { get; init; }
}

public record AccountUpdaterScheduleWithResult
{
    public List<object?> card { get; init; }
    public string created_at { get; init; }
    public bool? enabled { get; init; }
    public string? expiry { get; init; }
    public string id { get; init; }
    public Dictionary<string, object?>? most_recent_update { get; init; }
    public string? period_date { get; init; }
    public string period_id { get; init; }
    public string? response_format { get; init; }
    public List<object?> token { get; init; }
    public string type { get; init; }
    public string updated_at { get; init; }
}

public record AccountUpdaterScheduleWithResultListMatch
{
    public string account_id { get; init; }
    public string schedule_id { get; init; }
}

public record AccountUpdaterScheduleWithResultCreateData
{
    public string account_id { get; init; }
}

public record AccountUpdaterSubscriptionWithResult
{
    public string? created_at { get; init; }
    public bool? enabled { get; init; }
    public string? id { get; init; }
    public string? period_date { get; init; }
    public string? period_id { get; init; }
    public List<object?>? record { get; init; }
    public string? response_format { get; init; }
    public string? template_ref { get; init; }
    public string? updated_at { get; init; }
}

public record AccountUpdaterSubscriptionWithResultLoadMatch
{
    public string account_id { get; init; }
    public string subscription_id { get; init; }
}

public record AccountUpdaterSubscriptionWithResultCreateData
{
    public string account_id { get; init; }
    public string subscription_id { get; init; }
}

public record AccountUpdaterSubscriptionWithResultUpdateData
{
    public string account_id { get; init; }
    public string subscription_id { get; init; }
}

public record AccountUpdaterUpdate
{
    public string? account_updater_schedule_record_id { get; init; }
    public string? format { get; init; }
    public string? id { get; init; }
    public string? new_expiry { get; init; }
    public string? new_token { get; init; }
    public string? old_expiry { get; init; }
    public string? old_token { get; init; }
    public List<object?>? recurring_schedule { get; init; }
    public string? status { get; init; }
    public string? update_id { get; init; }
    public string? updated_at { get; init; }
}

public record AccountUpdaterUpdateLoadMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record ApiKey
{
    public List<object?>? account { get; init; }
    public bool? enabled { get; init; }
    public string? expires_at { get; init; }
    public string? expires_in { get; init; }
    public string? id { get; init; }
    public string? label { get; init; }
    public List<object?>? method { get; init; }
    public List<object?>? scope { get; init; }
    public string? secret { get; init; }
}

public record ApiKeyLoadMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record ApiKeyListMatch
{
    public string account_id { get; init; }
}

public record ApiKeyCreateData
{
    public string account_id { get; init; }
}

public record ApiKeyUpdateData
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record ApiKeyRemoveMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record ApplePayMerchantDetail
{
    public List<object?> domain { get; init; }
    public string merchant_url { get; init; }
    public string? partner_merchant_name { get; init; }
    public string payconex_account_id { get; init; }
}

public record ApplePayMerchantDetailListMatch
{
    public long account_id { get; init; }
}

public record ApplePayMerchantDetailCreateData
{
    public long account_id { get; init; }
}

public record ApplePaySession
{
    public string? display_name { get; init; }
    public string? domain_name { get; init; }
    public long? epoch_timestamp { get; init; }
    public long? expires_at { get; init; }
    public string? merchant_identifier { get; init; }
    public string? merchant_session_identifier { get; init; }
    public long? nonce { get; init; }
    public string? operational_analytics_identifier { get; init; }
    public string referrer { get; init; }
    public long? retry { get; init; }
    public string? signature { get; init; }
}

public record ApplePaySessionCreateData
{
    public long account_id { get; init; }
}

public record DynamicDescriptor
{
    public string? city { get; init; }
    public string? descriptor { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? state { get; init; }
}

public record DynamicDescriptorLoadMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record DynamicDescriptorListMatch
{
    public string account_id { get; init; }
}

public record DynamicDescriptorCreateData
{
    public string account_id { get; init; }
}

public record DynamicDescriptorUpdateData
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record DynamicDescriptorRemoveMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record IFrameCreateInstance
{
    public string? amount { get; init; }
    public string? currency { get; init; }
    public Dictionary<string, object?>? customer { get; init; }
    public bool? initialize_transaction { get; init; }
    public string label { get; init; }
    public string? language { get; init; }
    public string? reference { get; init; }
    public double? timeout { get; init; }
    public List<object?>? token { get; init; }
}

public record IFrameCreateInstanceCreateData
{
    public string account_id { get; init; }
    public string payment_iframe_id { get; init; }
}

public record IFrameInstance();

public record IFrameInstanceLoadMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
    public string payment_iframe_id { get; init; }
}

public record Iframe
{
    public Dictionary<string, object?>? ach_setting { get; init; }
    public List<object?> allowed_parent_domain { get; init; }
    public List<object?> allowed_payment_method { get; init; }
    public Dictionary<string, object?>? card_setting { get; init; }
    public Dictionary<string, object?>? click_to_pay_setting { get; init; }
    public string? currency { get; init; }
    public string? id { get; init; }
    public string label { get; init; }
    public string? language { get; init; }
    public double? timeout { get; init; }
}

public record IframeLoadMatch
{
    public string account_id { get; init; }
    public string iframe_id { get; init; }
}

public record IframeListMatch
{
    public string account_id { get; init; }
}

public record IframeCreateData
{
    public string account_id { get; init; }
}

public record IframeUpdateData
{
    public string account_id { get; init; }
    public string iframe_id { get; init; }
}

public record Init
{
    public Dictionary<string, object?>? customer { get; init; }
    public string? description { get; init; }
    public List<object?>? item { get; init; }
    public Dictionary<string, object?>? level2 { get; init; }
    public Dictionary<string, object?>? level3 { get; init; }
    public Dictionary<string, object?> shipping_address { get; init; }
    public Dictionary<string, object?>? trace { get; init; }
}

public record InitCreateData
{
    public string account_id { get; init; }
}

public record ListApiKeyScopesEntry
{
    public string? category { get; init; }
    public string? description { get; init; }
    public bool? enabled { get; init; }
    public long? level { get; init; }
    public string? scope { get; init; }
}

public record ListApiKeyScopesEntryListMatch
{
    public string? category { get; init; }
    public string? description { get; init; }
    public bool? enabled { get; init; }
    public long? level { get; init; }
    public string? scope { get; init; }
}

public record PaymentIframe();

public record PaymentIframeRemoveMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record ThreeDSecureAuth
{
    public Dictionary<string, object?> browser { get; init; }
    public Dictionary<string, object?> card { get; init; }
    public Dictionary<string, object?>? challenge { get; init; }
    public Dictionary<string, object?>? customer { get; init; }
    public Dictionary<string, object?> purchase { get; init; }
    public string? server_transaction_id { get; init; }
    public Dictionary<string, object?> shipping { get; init; }
    public string? status { get; init; }
    public string? three_d_secure_challenge_indicator { get; init; }
    public string? three_d_secure_id { get; init; }
    public Dictionary<string, object?>? trace { get; init; }
}

public record ThreeDSecureAuthCreateData
{
    public string account_id { get; init; }
}

public record ThreeDSecureBrowserInit
{
    public string? acs_result_url { get; init; }
    public string? acs_url { get; init; }
    public string? cvv { get; init; }
    public string expiry { get; init; }
    public string pan { get; init; }
    public string? payment_details_reference { get; init; }
    public string? server_transaction_id { get; init; }
    public string? status { get; init; }
    public string? three_d_secure_data { get; init; }
    public string? three_d_secure_id { get; init; }
}

public record ThreeDSecureBrowserInitCreateData
{
    public string account_id { get; init; }
}

public record ThreeDSecureStatus
{
    public Dictionary<string, object?>? error { get; init; }
    public Dictionary<string, object?>? info { get; init; }
    public string? server_transaction_id { get; init; }
    public string? status { get; init; }
    public Dictionary<string, object?>? three_d_secure { get; init; }
    public string? three_d_secure_id { get; init; }
}

public record ThreeDSecureStatusLoadMatch
{
    public string account_id { get; init; }
}

public record TransactionDetail
{
    public Dictionary<string, object?> amount { get; init; }
    public Dictionary<string, object?> auth { get; init; }
    public Dictionary<string, object?>? card { get; init; }
    public Dictionary<string, object?>? customer { get; init; }
    public string? description { get; init; }
    public string? id { get; init; }
    public List<object?>? item { get; init; }
    public Dictionary<string, object?>? level2 { get; init; }
    public Dictionary<string, object?>? level3 { get; init; }
    public Dictionary<string, object?>? @override { get; init; }
    public Dictionary<string, object?> shipping_address { get; init; }
    public string status { get; init; }
    public string? timestamp { get; init; }
    public Dictionary<string, object?>? trace { get; init; }
}

public record TransactionDetailLoadMatch
{
    public string account_id { get; init; }
    public string transaction_id { get; init; }
}

public record TransactionDetailUpdateData
{
    public string account_id { get; init; }
    public string transaction_id { get; init; }
}

public record Webhook
{
    public string @event { get; init; }
    public string? id { get; init; }
    public string url { get; init; }
}

public record WebhookLoadMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record WebhookListMatch
{
    public string account_id { get; init; }
}

public record WebhookCreateData
{
    public string account_id { get; init; }
}

public record WebhookUpdateData
{
    public string account_id { get; init; }
    public string id { get; init; }
}

public record WebhookRemoveMatch
{
    public string account_id { get; init; }
    public string id { get; init; }
}

