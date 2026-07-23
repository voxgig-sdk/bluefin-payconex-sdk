// Typed reference models for the BluefinPayconex SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params. The C++ SDK runtime is Value-based, so these structs are
// DOCUMENTATION / convenience types only — the SDK neither includes nor
// requires this header. Array fields surface as std::vector<Value>, object
// fields as std::map<std::string, Value>, and any/null fields as sdk::Value.
// Optional (req:false) members are flagged with a trailing "// optional"
// comment. Do not edit by hand.

#ifndef SDK_BLUEFINPAYCONEX_TYPES_HPP
#define SDK_BLUEFINPAYCONEX_TYPES_HPP

#include <cstdint>
#include <map>
#include <string>
#include <vector>

#include "core/types.hpp"

namespace sdk {
namespace types {

struct AccountUpdater {};

struct AccountUpdaterRemoveMatch {
  std::string account_id;
  std::string record_id;  // optional
  std::string subscription_id;
};

struct AccountUpdaterSchedule {
  bool enabled;  // optional
  std::string period_date;  // optional
  std::string period_id;
  std::string response_format;  // optional
  std::vector<Value> token;
};

struct AccountUpdaterScheduleCreateData {
  std::string account_id;
};

struct AccountUpdaterScheduleWithResult {
  std::vector<Value> card;
  std::string created_at;
  bool enabled;  // optional
  std::string expiry;  // optional
  std::string id;
  std::map<std::string, Value> most_recent_update;  // optional
  std::string period_date;  // optional
  std::string period_id;
  std::string response_format;  // optional
  std::vector<Value> token;
  std::string type;
  std::string updated_at;
};

struct AccountUpdaterScheduleWithResultListMatch {
  std::string account_id;
  std::string schedule_id;
};

struct AccountUpdaterScheduleWithResultCreateData {
  std::string account_id;
};

struct AccountUpdaterSubscriptionWithResult {
  std::string created_at;  // optional
  bool enabled;  // optional
  std::string id;  // optional
  std::string period_date;  // optional
  std::string period_id;  // optional
  std::vector<Value> record;  // optional
  std::string response_format;  // optional
  std::string template_ref;  // optional
  std::string updated_at;  // optional
};

struct AccountUpdaterSubscriptionWithResultLoadMatch {
  std::string account_id;
  std::string subscription_id;
};

struct AccountUpdaterSubscriptionWithResultCreateData {
  std::string account_id;
  std::string subscription_id;
};

struct AccountUpdaterSubscriptionWithResultUpdateData {
  std::string account_id;
  std::string subscription_id;
};

struct AccountUpdaterUpdate {
  std::string account_updater_schedule_record_id;  // optional
  std::string format;  // optional
  std::string id;  // optional
  std::string new_expiry;  // optional
  std::string new_token;  // optional
  std::string old_expiry;  // optional
  std::string old_token;  // optional
  std::vector<Value> recurring_schedule;  // optional
  std::string status;  // optional
  std::string update_id;  // optional
  std::string updated_at;  // optional
};

struct AccountUpdaterUpdateLoadMatch {
  std::string account_id;
  std::string id;
};

struct ApiKey {
  std::vector<Value> account;  // optional
  bool enabled;  // optional
  std::string expires_at;  // optional
  std::string expires_in;  // optional
  std::string id;  // optional
  std::string label;  // optional
  std::vector<Value> method;  // optional
  std::vector<Value> scope;  // optional
  std::string secret;  // optional
};

struct ApiKeyLoadMatch {
  std::string account_id;
  std::string id;
};

struct ApiKeyListMatch {
  std::string account_id;
};

struct ApiKeyCreateData {
  std::string account_id;
};

struct ApiKeyUpdateData {
  std::string account_id;
  std::string id;
};

struct ApiKeyRemoveMatch {
  std::string account_id;
  std::string id;
};

struct ApplePayMerchantDetail {
  std::vector<Value> domain;
  std::string merchant_url;
  std::string partner_merchant_name;  // optional
  std::string payconex_account_id;
};

struct ApplePayMerchantDetailListMatch {
  int64_t account_id;
};

struct ApplePayMerchantDetailCreateData {
  int64_t account_id;
};

struct ApplePaySession {
  std::string display_name;  // optional
  std::string domain_name;  // optional
  int64_t epoch_timestamp;  // optional
  int64_t expires_at;  // optional
  std::string merchant_identifier;  // optional
  std::string merchant_session_identifier;  // optional
  int64_t nonce;  // optional
  std::string operational_analytics_identifier;  // optional
  std::string referrer;
  int64_t retry;  // optional
  std::string signature;  // optional
};

struct ApplePaySessionCreateData {
  int64_t account_id;
};

struct DynamicDescriptor {
  std::string city;  // optional
  std::string descriptor;  // optional
  std::string id;  // optional
  std::string name;  // optional
  std::string state;  // optional
};

struct DynamicDescriptorLoadMatch {
  std::string account_id;
  std::string id;
};

struct DynamicDescriptorListMatch {
  std::string account_id;
};

struct DynamicDescriptorCreateData {
  std::string account_id;
};

struct DynamicDescriptorUpdateData {
  std::string account_id;
  std::string id;
};

struct DynamicDescriptorRemoveMatch {
  std::string account_id;
  std::string id;
};

struct IFrameCreateInstance {
  std::string amount;  // optional
  std::string currency;  // optional
  std::map<std::string, Value> customer;  // optional
  bool initialize_transaction;  // optional
  std::string label;
  std::string language;  // optional
  std::string reference;  // optional
  double timeout;  // optional
  std::vector<Value> token;  // optional
};

struct IFrameCreateInstanceCreateData {
  std::string account_id;
  std::string payment_iframe_id;
};

struct IFrameInstance {};

struct IFrameInstanceLoadMatch {
  std::string account_id;
  std::string id;
  std::string payment_iframe_id;
};

struct Iframe {
  std::map<std::string, Value> ach_setting;  // optional
  std::vector<Value> allowed_parent_domain;
  std::vector<Value> allowed_payment_method;
  std::map<std::string, Value> card_setting;  // optional
  std::map<std::string, Value> click_to_pay_setting;  // optional
  std::string currency;  // optional
  std::string id;  // optional
  std::string label;
  std::string language;  // optional
  double timeout;  // optional
};

struct IframeLoadMatch {
  std::string account_id;
  std::string iframe_id;
};

struct IframeListMatch {
  std::string account_id;
};

struct IframeCreateData {
  std::string account_id;
};

struct IframeUpdateData {
  std::string account_id;
  std::string iframe_id;
};

struct Init {
  std::map<std::string, Value> customer;  // optional
  std::string description;  // optional
  std::vector<Value> item;  // optional
  std::map<std::string, Value> level2;  // optional
  std::map<std::string, Value> level3;  // optional
  std::map<std::string, Value> shipping_address;
  std::map<std::string, Value> trace;  // optional
};

struct InitCreateData {
  std::string account_id;
};

struct ListApiKeyScopesEntry {
  std::string category;  // optional
  std::string description;  // optional
  bool enabled;  // optional
  int64_t level;  // optional
  std::string scope;  // optional
};

struct ListApiKeyScopesEntryListMatch {
  std::string category;  // optional
  std::string description;  // optional
  bool enabled;  // optional
  int64_t level;  // optional
  std::string scope;  // optional
};

struct PaymentIframe {};

struct PaymentIframeRemoveMatch {
  std::string account_id;
  std::string id;
};

struct ThreeDSecureAuth {
  std::map<std::string, Value> browser;
  std::map<std::string, Value> card;
  std::map<std::string, Value> challenge;  // optional
  std::map<std::string, Value> customer;  // optional
  std::map<std::string, Value> purchase;
  std::string server_transaction_id;  // optional
  std::map<std::string, Value> shipping;
  std::string status;  // optional
  std::string three_d_secure_challenge_indicator;  // optional
  std::string three_d_secure_id;  // optional
  std::map<std::string, Value> trace;  // optional
};

struct ThreeDSecureAuthCreateData {
  std::string account_id;
};

struct ThreeDSecureBrowserInit {
  std::string acs_result_url;  // optional
  std::string acs_url;  // optional
  std::string cvv;  // optional
  std::string expiry;
  std::string pan;
  std::string payment_details_reference;  // optional
  std::string server_transaction_id;  // optional
  std::string status;  // optional
  std::string three_d_secure_data;  // optional
  std::string three_d_secure_id;  // optional
};

struct ThreeDSecureBrowserInitCreateData {
  std::string account_id;
};

struct ThreeDSecureStatus {
  std::map<std::string, Value> error;  // optional
  std::map<std::string, Value> info;  // optional
  std::string server_transaction_id;  // optional
  std::string status;  // optional
  std::map<std::string, Value> three_d_secure;  // optional
  std::string three_d_secure_id;  // optional
};

struct ThreeDSecureStatusLoadMatch {
  std::string account_id;
};

struct TransactionDetail {
  std::map<std::string, Value> amount;
  std::map<std::string, Value> auth;
  std::map<std::string, Value> card;  // optional
  std::map<std::string, Value> customer;  // optional
  std::string description;  // optional
  std::string id;  // optional
  std::vector<Value> item;  // optional
  std::map<std::string, Value> level2;  // optional
  std::map<std::string, Value> level3;  // optional
  std::map<std::string, Value> override;  // optional
  std::map<std::string, Value> shipping_address;
  std::string status;
  std::string timestamp;  // optional
  std::map<std::string, Value> trace;  // optional
};

struct TransactionDetailLoadMatch {
  std::string account_id;
  std::string transaction_id;
};

struct TransactionDetailUpdateData {
  std::string account_id;
  std::string transaction_id;
};

struct Webhook {
  std::string event;
  std::string id;  // optional
  std::string url;
};

struct WebhookLoadMatch {
  std::string account_id;
  std::string id;
};

struct WebhookListMatch {
  std::string account_id;
};

struct WebhookCreateData {
  std::string account_id;
};

struct WebhookUpdateData {
  std::string account_id;
  std::string id;
};

struct WebhookRemoveMatch {
  std::string account_id;
  std::string id;
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINPAYCONEX_TYPES_HPP
