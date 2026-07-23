// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.
#![allow(dead_code, non_snake_case, unused_imports)]

use crate::utility::voxgigstruct::Value;

/// AccountUpdater is the typed data model for the account_updater entity.
#[derive(Debug, Clone)]
pub struct AccountUpdater {
}

/// AccountUpdaterRemoveMatch is the typed request payload for AccountUpdater.remove.
#[derive(Debug, Clone)]
pub struct AccountUpdaterRemoveMatch {
    pub account_id: String,
    pub record_id: Option<String>,
    pub subscription_id: String,
}

/// AccountUpdaterSchedule is the typed data model for the account_updater_schedule entity.
#[derive(Debug, Clone)]
pub struct AccountUpdaterSchedule {
    pub enabled: Option<bool>,
    pub period_date: Option<String>,
    pub period_id: String,
    pub response_format: Option<String>,
    pub token: Vec<Value>,
}

/// AccountUpdaterScheduleCreateData is the typed request payload for AccountUpdaterSchedule.create.
#[derive(Debug, Clone)]
pub struct AccountUpdaterScheduleCreateData {
    pub account_id: String,
}

/// AccountUpdaterScheduleWithResult is the typed data model for the account_updater_schedule_with_result entity.
#[derive(Debug, Clone)]
pub struct AccountUpdaterScheduleWithResult {
    pub card: Vec<Value>,
    pub created_at: String,
    pub enabled: Option<bool>,
    pub expiry: Option<String>,
    pub id: String,
    pub most_recent_update: Option<std::collections::HashMap<String, Value>>,
    pub period_date: Option<String>,
    pub period_id: String,
    pub response_format: Option<String>,
    pub token: Vec<Value>,
    pub type_: String,
    pub updated_at: String,
}

/// AccountUpdaterScheduleWithResultListMatch is the typed request payload for AccountUpdaterScheduleWithResult.list.
#[derive(Debug, Clone)]
pub struct AccountUpdaterScheduleWithResultListMatch {
    pub account_id: String,
    pub schedule_id: String,
}

/// AccountUpdaterScheduleWithResultCreateData is the typed request payload for AccountUpdaterScheduleWithResult.create.
#[derive(Debug, Clone)]
pub struct AccountUpdaterScheduleWithResultCreateData {
    pub account_id: String,
}

/// AccountUpdaterSubscriptionWithResult is the typed data model for the account_updater_subscription_with_result entity.
#[derive(Debug, Clone)]
pub struct AccountUpdaterSubscriptionWithResult {
    pub created_at: Option<String>,
    pub enabled: Option<bool>,
    pub id: Option<String>,
    pub period_date: Option<String>,
    pub period_id: Option<String>,
    pub record: Option<Vec<Value>>,
    pub response_format: Option<String>,
    pub template_ref: Option<String>,
    pub updated_at: Option<String>,
}

/// AccountUpdaterSubscriptionWithResultLoadMatch is the typed request payload for AccountUpdaterSubscriptionWithResult.load.
#[derive(Debug, Clone)]
pub struct AccountUpdaterSubscriptionWithResultLoadMatch {
    pub account_id: String,
    pub subscription_id: String,
}

/// AccountUpdaterSubscriptionWithResultCreateData is the typed request payload for AccountUpdaterSubscriptionWithResult.create.
#[derive(Debug, Clone)]
pub struct AccountUpdaterSubscriptionWithResultCreateData {
    pub account_id: String,
    pub subscription_id: String,
}

/// AccountUpdaterSubscriptionWithResultUpdateData is the typed request payload for AccountUpdaterSubscriptionWithResult.update.
#[derive(Debug, Clone)]
pub struct AccountUpdaterSubscriptionWithResultUpdateData {
    pub account_id: String,
    pub subscription_id: String,
}

/// AccountUpdaterUpdate is the typed data model for the account_updater_update entity.
#[derive(Debug, Clone)]
pub struct AccountUpdaterUpdate {
    pub account_updater_schedule_record_id: Option<String>,
    pub format: Option<String>,
    pub id: Option<String>,
    pub new_expiry: Option<String>,
    pub new_token: Option<String>,
    pub old_expiry: Option<String>,
    pub old_token: Option<String>,
    pub recurring_schedule: Option<Vec<Value>>,
    pub status: Option<String>,
    pub update_id: Option<String>,
    pub updated_at: Option<String>,
}

/// AccountUpdaterUpdateLoadMatch is the typed request payload for AccountUpdaterUpdate.load.
#[derive(Debug, Clone)]
pub struct AccountUpdaterUpdateLoadMatch {
    pub account_id: String,
    pub id: String,
}

/// ApiKey is the typed data model for the api_key entity.
#[derive(Debug, Clone)]
pub struct ApiKey {
    pub account: Option<Vec<Value>>,
    pub enabled: Option<bool>,
    pub expires_at: Option<String>,
    pub expires_in: Option<String>,
    pub id: Option<String>,
    pub label: Option<String>,
    pub method: Option<Vec<Value>>,
    pub scope: Option<Vec<Value>>,
    pub secret: Option<String>,
}

/// ApiKeyLoadMatch is the typed request payload for ApiKey.load.
#[derive(Debug, Clone)]
pub struct ApiKeyLoadMatch {
    pub account_id: String,
    pub id: String,
}

/// ApiKeyListMatch is the typed request payload for ApiKey.list.
#[derive(Debug, Clone)]
pub struct ApiKeyListMatch {
    pub account_id: String,
}

/// ApiKeyCreateData is the typed request payload for ApiKey.create.
#[derive(Debug, Clone)]
pub struct ApiKeyCreateData {
    pub account_id: String,
}

/// ApiKeyUpdateData is the typed request payload for ApiKey.update.
#[derive(Debug, Clone)]
pub struct ApiKeyUpdateData {
    pub account_id: String,
    pub id: String,
}

/// ApiKeyRemoveMatch is the typed request payload for ApiKey.remove.
#[derive(Debug, Clone)]
pub struct ApiKeyRemoveMatch {
    pub account_id: String,
    pub id: String,
}

/// ApplePayMerchantDetail is the typed data model for the apple_pay_merchant_detail entity.
#[derive(Debug, Clone)]
pub struct ApplePayMerchantDetail {
    pub domain: Vec<Value>,
    pub merchant_url: String,
    pub partner_merchant_name: Option<String>,
    pub payconex_account_id: String,
}

/// ApplePayMerchantDetailListMatch is the typed request payload for ApplePayMerchantDetail.list.
#[derive(Debug, Clone)]
pub struct ApplePayMerchantDetailListMatch {
    pub account_id: i64,
}

/// ApplePayMerchantDetailCreateData is the typed request payload for ApplePayMerchantDetail.create.
#[derive(Debug, Clone)]
pub struct ApplePayMerchantDetailCreateData {
    pub account_id: i64,
}

/// ApplePaySession is the typed data model for the apple_pay_session entity.
#[derive(Debug, Clone)]
pub struct ApplePaySession {
    pub display_name: Option<String>,
    pub domain_name: Option<String>,
    pub epoch_timestamp: Option<i64>,
    pub expires_at: Option<i64>,
    pub merchant_identifier: Option<String>,
    pub merchant_session_identifier: Option<String>,
    pub nonce: Option<i64>,
    pub operational_analytics_identifier: Option<String>,
    pub referrer: String,
    pub retry: Option<i64>,
    pub signature: Option<String>,
}

/// ApplePaySessionCreateData is the typed request payload for ApplePaySession.create.
#[derive(Debug, Clone)]
pub struct ApplePaySessionCreateData {
    pub account_id: i64,
}

/// DynamicDescriptor is the typed data model for the dynamic_descriptor entity.
#[derive(Debug, Clone)]
pub struct DynamicDescriptor {
    pub city: Option<String>,
    pub descriptor: Option<String>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub state: Option<String>,
}

/// DynamicDescriptorLoadMatch is the typed request payload for DynamicDescriptor.load.
#[derive(Debug, Clone)]
pub struct DynamicDescriptorLoadMatch {
    pub account_id: String,
    pub id: String,
}

/// DynamicDescriptorListMatch is the typed request payload for DynamicDescriptor.list.
#[derive(Debug, Clone)]
pub struct DynamicDescriptorListMatch {
    pub account_id: String,
}

/// DynamicDescriptorCreateData is the typed request payload for DynamicDescriptor.create.
#[derive(Debug, Clone)]
pub struct DynamicDescriptorCreateData {
    pub account_id: String,
}

/// DynamicDescriptorUpdateData is the typed request payload for DynamicDescriptor.update.
#[derive(Debug, Clone)]
pub struct DynamicDescriptorUpdateData {
    pub account_id: String,
    pub id: String,
}

/// DynamicDescriptorRemoveMatch is the typed request payload for DynamicDescriptor.remove.
#[derive(Debug, Clone)]
pub struct DynamicDescriptorRemoveMatch {
    pub account_id: String,
    pub id: String,
}

/// IFrameCreateInstance is the typed data model for the i_frame_create_instance entity.
#[derive(Debug, Clone)]
pub struct IFrameCreateInstance {
    pub amount: Option<String>,
    pub currency: Option<String>,
    pub customer: Option<std::collections::HashMap<String, Value>>,
    pub initialize_transaction: Option<bool>,
    pub label: String,
    pub language: Option<String>,
    pub reference: Option<String>,
    pub timeout: Option<f64>,
    pub token: Option<Vec<Value>>,
}

/// IFrameCreateInstanceCreateData is the typed request payload for IFrameCreateInstance.create.
#[derive(Debug, Clone)]
pub struct IFrameCreateInstanceCreateData {
    pub account_id: String,
    pub payment_iframe_id: String,
}

/// IFrameInstance is the typed data model for the i_frame_instance entity.
#[derive(Debug, Clone)]
pub struct IFrameInstance {
}

/// IFrameInstanceLoadMatch is the typed request payload for IFrameInstance.load.
#[derive(Debug, Clone)]
pub struct IFrameInstanceLoadMatch {
    pub account_id: String,
    pub id: String,
    pub payment_iframe_id: String,
}

/// Iframe is the typed data model for the iframe entity.
#[derive(Debug, Clone)]
pub struct Iframe {
    pub ach_setting: Option<std::collections::HashMap<String, Value>>,
    pub allowed_parent_domain: Vec<Value>,
    pub allowed_payment_method: Vec<Value>,
    pub card_setting: Option<std::collections::HashMap<String, Value>>,
    pub click_to_pay_setting: Option<std::collections::HashMap<String, Value>>,
    pub currency: Option<String>,
    pub id: Option<String>,
    pub label: String,
    pub language: Option<String>,
    pub timeout: Option<f64>,
}

/// IframeLoadMatch is the typed request payload for Iframe.load.
#[derive(Debug, Clone)]
pub struct IframeLoadMatch {
    pub account_id: String,
    pub iframe_id: String,
}

/// IframeListMatch is the typed request payload for Iframe.list.
#[derive(Debug, Clone)]
pub struct IframeListMatch {
    pub account_id: String,
}

/// IframeCreateData is the typed request payload for Iframe.create.
#[derive(Debug, Clone)]
pub struct IframeCreateData {
    pub account_id: String,
}

/// IframeUpdateData is the typed request payload for Iframe.update.
#[derive(Debug, Clone)]
pub struct IframeUpdateData {
    pub account_id: String,
    pub iframe_id: String,
}

/// Init is the typed data model for the init entity.
#[derive(Debug, Clone)]
pub struct Init {
    pub customer: Option<std::collections::HashMap<String, Value>>,
    pub description: Option<String>,
    pub item: Option<Vec<Value>>,
    pub level2: Option<std::collections::HashMap<String, Value>>,
    pub level3: Option<std::collections::HashMap<String, Value>>,
    pub shipping_address: std::collections::HashMap<String, Value>,
    pub trace: Option<std::collections::HashMap<String, Value>>,
}

/// InitCreateData is the typed request payload for Init.create.
#[derive(Debug, Clone)]
pub struct InitCreateData {
    pub account_id: String,
}

/// ListApiKeyScopesEntry is the typed data model for the list_api_key_scopes_entry entity.
#[derive(Debug, Clone)]
pub struct ListApiKeyScopesEntry {
    pub category: Option<String>,
    pub description: Option<String>,
    pub enabled: Option<bool>,
    pub level: Option<i64>,
    pub scope: Option<String>,
}

/// ListApiKeyScopesEntryListMatch is the typed request payload for ListApiKeyScopesEntry.list.
#[derive(Debug, Clone)]
pub struct ListApiKeyScopesEntryListMatch {
    pub category: Option<String>,
    pub description: Option<String>,
    pub enabled: Option<bool>,
    pub level: Option<i64>,
    pub scope: Option<String>,
}

/// PaymentIframe is the typed data model for the payment_iframe entity.
#[derive(Debug, Clone)]
pub struct PaymentIframe {
}

/// PaymentIframeRemoveMatch is the typed request payload for PaymentIframe.remove.
#[derive(Debug, Clone)]
pub struct PaymentIframeRemoveMatch {
    pub account_id: String,
    pub id: String,
}

/// ThreeDSecureAuth is the typed data model for the three_d_secure_auth entity.
#[derive(Debug, Clone)]
pub struct ThreeDSecureAuth {
    pub browser: std::collections::HashMap<String, Value>,
    pub card: std::collections::HashMap<String, Value>,
    pub challenge: Option<std::collections::HashMap<String, Value>>,
    pub customer: Option<std::collections::HashMap<String, Value>>,
    pub purchase: std::collections::HashMap<String, Value>,
    pub server_transaction_id: Option<String>,
    pub shipping: std::collections::HashMap<String, Value>,
    pub status: Option<String>,
    pub three_d_secure_challenge_indicator: Option<String>,
    pub three_d_secure_id: Option<String>,
    pub trace: Option<std::collections::HashMap<String, Value>>,
}

/// ThreeDSecureAuthCreateData is the typed request payload for ThreeDSecureAuth.create.
#[derive(Debug, Clone)]
pub struct ThreeDSecureAuthCreateData {
    pub 3_d_id: String,
    pub account_id: String,
}

/// ThreeDSecureBrowserInit is the typed data model for the three_d_secure_browser_init entity.
#[derive(Debug, Clone)]
pub struct ThreeDSecureBrowserInit {
    pub acs_result_url: Option<String>,
    pub acs_url: Option<String>,
    pub cvv: Option<String>,
    pub expiry: String,
    pub pan: String,
    pub payment_details_reference: Option<String>,
    pub server_transaction_id: Option<String>,
    pub status: Option<String>,
    pub three_d_secure_data: Option<String>,
    pub three_d_secure_id: Option<String>,
}

/// ThreeDSecureBrowserInitCreateData is the typed request payload for ThreeDSecureBrowserInit.create.
#[derive(Debug, Clone)]
pub struct ThreeDSecureBrowserInitCreateData {
    pub account_id: String,
}

/// ThreeDSecureStatus is the typed data model for the three_d_secure_status entity.
#[derive(Debug, Clone)]
pub struct ThreeDSecureStatus {
    pub error: Option<std::collections::HashMap<String, Value>>,
    pub info: Option<std::collections::HashMap<String, Value>>,
    pub server_transaction_id: Option<String>,
    pub status: Option<String>,
    pub three_d_secure: Option<std::collections::HashMap<String, Value>>,
    pub three_d_secure_id: Option<String>,
}

/// ThreeDSecureStatusLoadMatch is the typed request payload for ThreeDSecureStatus.load.
#[derive(Debug, Clone)]
pub struct ThreeDSecureStatusLoadMatch {
    pub 3_d_id: String,
    pub account_id: String,
}

/// TransactionDetail is the typed data model for the transaction_detail entity.
#[derive(Debug, Clone)]
pub struct TransactionDetail {
    pub amount: std::collections::HashMap<String, Value>,
    pub auth: std::collections::HashMap<String, Value>,
    pub card: Option<std::collections::HashMap<String, Value>>,
    pub customer: Option<std::collections::HashMap<String, Value>>,
    pub description: Option<String>,
    pub id: Option<String>,
    pub item: Option<Vec<Value>>,
    pub level2: Option<std::collections::HashMap<String, Value>>,
    pub level3: Option<std::collections::HashMap<String, Value>>,
    pub override_: Option<std::collections::HashMap<String, Value>>,
    pub shipping_address: std::collections::HashMap<String, Value>,
    pub status: String,
    pub timestamp: Option<String>,
    pub trace: Option<std::collections::HashMap<String, Value>>,
}

/// TransactionDetailLoadMatch is the typed request payload for TransactionDetail.load.
#[derive(Debug, Clone)]
pub struct TransactionDetailLoadMatch {
    pub account_id: String,
    pub transaction_id: String,
}

/// TransactionDetailUpdateData is the typed request payload for TransactionDetail.update.
#[derive(Debug, Clone)]
pub struct TransactionDetailUpdateData {
    pub account_id: String,
    pub transaction_id: String,
}

/// Webhook is the typed data model for the webhook entity.
#[derive(Debug, Clone)]
pub struct Webhook {
    pub event: String,
    pub id: Option<String>,
    pub url: String,
}

/// WebhookLoadMatch is the typed request payload for Webhook.load.
#[derive(Debug, Clone)]
pub struct WebhookLoadMatch {
    pub account_id: String,
    pub id: String,
}

/// WebhookListMatch is the typed request payload for Webhook.list.
#[derive(Debug, Clone)]
pub struct WebhookListMatch {
    pub account_id: String,
}

/// WebhookCreateData is the typed request payload for Webhook.create.
#[derive(Debug, Clone)]
pub struct WebhookCreateData {
    pub account_id: String,
}

/// WebhookUpdateData is the typed request payload for Webhook.update.
#[derive(Debug, Clone)]
pub struct WebhookUpdateData {
    pub account_id: String,
    pub id: String,
}

/// WebhookRemoveMatch is the typed request payload for Webhook.remove.
#[derive(Debug, Clone)]
pub struct WebhookRemoveMatch {
    pub account_id: String,
    pub id: String,
}

