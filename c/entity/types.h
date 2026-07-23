// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return
// `voxgig_value*`), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support. This header is standalone
// and is not #included by any generated .c.

#ifndef BLUEFINPAYCONEX_ENTITY_TYPES_H
#define BLUEFINPAYCONEX_ENTITY_TYPES_H

#include "sdk.h"

// AccountUpdater is the typed data model for the account_updater entity.
typedef struct {
  char _unused;  // placeholder: no modelled members
} AccountUpdater;

// AccountUpdaterRemoveMatch is the typed request payload for AccountUpdater.remove.
typedef struct {
  char*account_id;
  char*record_id;  // optional
  char*subscription_id;
} AccountUpdaterRemoveMatch;

// AccountUpdaterSchedule is the typed data model for the account_updater_schedule entity.
typedef struct {
  bool enabled;  // optional
  char*period_date;  // optional
  char*period_id;
  char*response_format;  // optional
  voxgig_value*token;
} AccountUpdaterSchedule;

// AccountUpdaterScheduleCreateData is the typed request payload for AccountUpdaterSchedule.create.
typedef struct {
  char*account_id;
} AccountUpdaterScheduleCreateData;

// AccountUpdaterScheduleWithResult is the typed data model for the account_updater_schedule_with_result entity.
typedef struct {
  voxgig_value*card;
  char*created_at;
  bool enabled;  // optional
  char*expiry;  // optional
  char*id;
  voxgig_value*most_recent_update;  // optional
  char*period_date;  // optional
  char*period_id;
  char*response_format;  // optional
  voxgig_value*token;
  char*type;
  char*updated_at;
} AccountUpdaterScheduleWithResult;

// AccountUpdaterScheduleWithResultListMatch is the typed request payload for AccountUpdaterScheduleWithResult.list.
typedef struct {
  char*account_id;
  char*schedule_id;
} AccountUpdaterScheduleWithResultListMatch;

// AccountUpdaterScheduleWithResultCreateData is the typed request payload for AccountUpdaterScheduleWithResult.create.
typedef struct {
  char*account_id;
} AccountUpdaterScheduleWithResultCreateData;

// AccountUpdaterSubscriptionWithResult is the typed data model for the account_updater_subscription_with_result entity.
typedef struct {
  char*created_at;  // optional
  bool enabled;  // optional
  char*id;  // optional
  char*period_date;  // optional
  char*period_id;  // optional
  voxgig_value*record;  // optional
  char*response_format;  // optional
  char*template_ref;  // optional
  char*updated_at;  // optional
} AccountUpdaterSubscriptionWithResult;

// AccountUpdaterSubscriptionWithResultLoadMatch is the typed request payload for AccountUpdaterSubscriptionWithResult.load.
typedef struct {
  char*account_id;
  char*subscription_id;
} AccountUpdaterSubscriptionWithResultLoadMatch;

// AccountUpdaterSubscriptionWithResultCreateData is the typed request payload for AccountUpdaterSubscriptionWithResult.create.
typedef struct {
  char*account_id;
  char*subscription_id;
} AccountUpdaterSubscriptionWithResultCreateData;

// AccountUpdaterSubscriptionWithResultUpdateData is the typed request payload for AccountUpdaterSubscriptionWithResult.update.
typedef struct {
  char*account_id;
  char*subscription_id;
} AccountUpdaterSubscriptionWithResultUpdateData;

// AccountUpdaterUpdate is the typed data model for the account_updater_update entity.
typedef struct {
  char*account_updater_schedule_record_id;  // optional
  char*format;  // optional
  char*id;  // optional
  char*new_expiry;  // optional
  char*new_token;  // optional
  char*old_expiry;  // optional
  char*old_token;  // optional
  voxgig_value*recurring_schedule;  // optional
  char*status;  // optional
  char*update_id;  // optional
  char*updated_at;  // optional
} AccountUpdaterUpdate;

// AccountUpdaterUpdateLoadMatch is the typed request payload for AccountUpdaterUpdate.load.
typedef struct {
  char*account_id;
  char*id;
} AccountUpdaterUpdateLoadMatch;

// ApiKey is the typed data model for the api_key entity.
typedef struct {
  voxgig_value*account;  // optional
  bool enabled;  // optional
  char*expires_at;  // optional
  char*expires_in;  // optional
  char*id;  // optional
  char*label;  // optional
  voxgig_value*method;  // optional
  voxgig_value*scope;  // optional
  char*secret;  // optional
} ApiKey;

// ApiKeyLoadMatch is the typed request payload for ApiKey.load.
typedef struct {
  char*account_id;
  char*id;
} ApiKeyLoadMatch;

// ApiKeyListMatch is the typed request payload for ApiKey.list.
typedef struct {
  char*account_id;
} ApiKeyListMatch;

// ApiKeyCreateData is the typed request payload for ApiKey.create.
typedef struct {
  char*account_id;
} ApiKeyCreateData;

// ApiKeyUpdateData is the typed request payload for ApiKey.update.
typedef struct {
  char*account_id;
  char*id;
} ApiKeyUpdateData;

// ApiKeyRemoveMatch is the typed request payload for ApiKey.remove.
typedef struct {
  char*account_id;
  char*id;
} ApiKeyRemoveMatch;

// ApplePayMerchantDetail is the typed data model for the apple_pay_merchant_detail entity.
typedef struct {
  voxgig_value*domain;
  char*merchant_url;
  char*partner_merchant_name;  // optional
  char*payconex_account_id;
} ApplePayMerchantDetail;

// ApplePayMerchantDetailListMatch is the typed request payload for ApplePayMerchantDetail.list.
typedef struct {
  int64_t account_id;
} ApplePayMerchantDetailListMatch;

// ApplePayMerchantDetailCreateData is the typed request payload for ApplePayMerchantDetail.create.
typedef struct {
  int64_t account_id;
} ApplePayMerchantDetailCreateData;

// ApplePaySession is the typed data model for the apple_pay_session entity.
typedef struct {
  char*display_name;  // optional
  char*domain_name;  // optional
  int64_t epoch_timestamp;  // optional
  int64_t expires_at;  // optional
  char*merchant_identifier;  // optional
  char*merchant_session_identifier;  // optional
  int64_t nonce;  // optional
  char*operational_analytics_identifier;  // optional
  char*referrer;
  int64_t retry;  // optional
  char*signature;  // optional
} ApplePaySession;

// ApplePaySessionCreateData is the typed request payload for ApplePaySession.create.
typedef struct {
  int64_t account_id;
} ApplePaySessionCreateData;

// DynamicDescriptor is the typed data model for the dynamic_descriptor entity.
typedef struct {
  char*city;  // optional
  char*descriptor;  // optional
  char*id;  // optional
  char*name;  // optional
  char*state;  // optional
} DynamicDescriptor;

// DynamicDescriptorLoadMatch is the typed request payload for DynamicDescriptor.load.
typedef struct {
  char*account_id;
  char*id;
} DynamicDescriptorLoadMatch;

// DynamicDescriptorListMatch is the typed request payload for DynamicDescriptor.list.
typedef struct {
  char*account_id;
} DynamicDescriptorListMatch;

// DynamicDescriptorCreateData is the typed request payload for DynamicDescriptor.create.
typedef struct {
  char*account_id;
} DynamicDescriptorCreateData;

// DynamicDescriptorUpdateData is the typed request payload for DynamicDescriptor.update.
typedef struct {
  char*account_id;
  char*id;
} DynamicDescriptorUpdateData;

// DynamicDescriptorRemoveMatch is the typed request payload for DynamicDescriptor.remove.
typedef struct {
  char*account_id;
  char*id;
} DynamicDescriptorRemoveMatch;

// IFrameCreateInstance is the typed data model for the i_frame_create_instance entity.
typedef struct {
  char*amount;  // optional
  char*currency;  // optional
  voxgig_value*customer;  // optional
  bool initialize_transaction;  // optional
  char*label;
  char*language;  // optional
  char*reference;  // optional
  double timeout;  // optional
  voxgig_value*token;  // optional
} IFrameCreateInstance;

// IFrameCreateInstanceCreateData is the typed request payload for IFrameCreateInstance.create.
typedef struct {
  char*account_id;
  char*payment_iframe_id;
} IFrameCreateInstanceCreateData;

// IFrameInstance is the typed data model for the i_frame_instance entity.
typedef struct {
  char _unused;  // placeholder: no modelled members
} IFrameInstance;

// IFrameInstanceLoadMatch is the typed request payload for IFrameInstance.load.
typedef struct {
  char*account_id;
  char*id;
  char*payment_iframe_id;
} IFrameInstanceLoadMatch;

// Iframe is the typed data model for the iframe entity.
typedef struct {
  voxgig_value*ach_setting;  // optional
  voxgig_value*allowed_parent_domain;
  voxgig_value*allowed_payment_method;
  voxgig_value*card_setting;  // optional
  voxgig_value*click_to_pay_setting;  // optional
  char*currency;  // optional
  char*id;  // optional
  char*label;
  char*language;  // optional
  double timeout;  // optional
} Iframe;

// IframeLoadMatch is the typed request payload for Iframe.load.
typedef struct {
  char*account_id;
  char*iframe_id;
} IframeLoadMatch;

// IframeListMatch is the typed request payload for Iframe.list.
typedef struct {
  char*account_id;
} IframeListMatch;

// IframeCreateData is the typed request payload for Iframe.create.
typedef struct {
  char*account_id;
} IframeCreateData;

// IframeUpdateData is the typed request payload for Iframe.update.
typedef struct {
  char*account_id;
  char*iframe_id;
} IframeUpdateData;

// Init is the typed data model for the init entity.
typedef struct {
  voxgig_value*customer;  // optional
  char*description;  // optional
  voxgig_value*item;  // optional
  voxgig_value*level2;  // optional
  voxgig_value*level3;  // optional
  voxgig_value*shipping_address;
  voxgig_value*trace;  // optional
} Init;

// InitCreateData is the typed request payload for Init.create.
typedef struct {
  char*account_id;
} InitCreateData;

// ListApiKeyScopesEntry is the typed data model for the list_api_key_scopes_entry entity.
typedef struct {
  char*category;  // optional
  char*description;  // optional
  bool enabled;  // optional
  int64_t level;  // optional
  char*scope;  // optional
} ListApiKeyScopesEntry;

// ListApiKeyScopesEntryListMatch is the typed request payload for ListApiKeyScopesEntry.list.
typedef struct {
  char*category;  // optional
  char*description;  // optional
  bool enabled;  // optional
  int64_t level;  // optional
  char*scope;  // optional
} ListApiKeyScopesEntryListMatch;

// PaymentIframe is the typed data model for the payment_iframe entity.
typedef struct {
  char _unused;  // placeholder: no modelled members
} PaymentIframe;

// PaymentIframeRemoveMatch is the typed request payload for PaymentIframe.remove.
typedef struct {
  char*account_id;
  char*id;
} PaymentIframeRemoveMatch;

// ThreeDSecureAuth is the typed data model for the three_d_secure_auth entity.
typedef struct {
  voxgig_value*browser;
  voxgig_value*card;
  voxgig_value*challenge;  // optional
  voxgig_value*customer;  // optional
  voxgig_value*purchase;
  char*server_transaction_id;  // optional
  voxgig_value*shipping;
  char*status;  // optional
  char*three_d_secure_challenge_indicator;  // optional
  char*three_d_secure_id;  // optional
  voxgig_value*trace;  // optional
} ThreeDSecureAuth;

// ThreeDSecureAuthCreateData is the typed request payload for ThreeDSecureAuth.create.
typedef struct {
  char*_3_d_id;
  char*account_id;
} ThreeDSecureAuthCreateData;

// ThreeDSecureBrowserInit is the typed data model for the three_d_secure_browser_init entity.
typedef struct {
  char*acs_result_url;  // optional
  char*acs_url;  // optional
  char*cvv;  // optional
  char*expiry;
  char*pan;
  char*payment_details_reference;  // optional
  char*server_transaction_id;  // optional
  char*status;  // optional
  char*three_d_secure_data;  // optional
  char*three_d_secure_id;  // optional
} ThreeDSecureBrowserInit;

// ThreeDSecureBrowserInitCreateData is the typed request payload for ThreeDSecureBrowserInit.create.
typedef struct {
  char*account_id;
} ThreeDSecureBrowserInitCreateData;

// ThreeDSecureStatus is the typed data model for the three_d_secure_status entity.
typedef struct {
  voxgig_value*error;  // optional
  voxgig_value*info;  // optional
  char*server_transaction_id;  // optional
  char*status;  // optional
  voxgig_value*three_d_secure;  // optional
  char*three_d_secure_id;  // optional
} ThreeDSecureStatus;

// ThreeDSecureStatusLoadMatch is the typed request payload for ThreeDSecureStatus.load.
typedef struct {
  char*_3_d_id;
  char*account_id;
} ThreeDSecureStatusLoadMatch;

// TransactionDetail is the typed data model for the transaction_detail entity.
typedef struct {
  voxgig_value*amount;
  voxgig_value*auth;
  voxgig_value*card;  // optional
  voxgig_value*customer;  // optional
  char*description;  // optional
  char*id;  // optional
  voxgig_value*item;  // optional
  voxgig_value*level2;  // optional
  voxgig_value*level3;  // optional
  voxgig_value*override;  // optional
  voxgig_value*shipping_address;
  char*status;
  char*timestamp;  // optional
  voxgig_value*trace;  // optional
} TransactionDetail;

// TransactionDetailLoadMatch is the typed request payload for TransactionDetail.load.
typedef struct {
  char*account_id;
  char*transaction_id;
} TransactionDetailLoadMatch;

// TransactionDetailUpdateData is the typed request payload for TransactionDetail.update.
typedef struct {
  char*account_id;
  char*transaction_id;
} TransactionDetailUpdateData;

// Webhook is the typed data model for the webhook entity.
typedef struct {
  char*event;
  char*id;  // optional
  char*url;
} Webhook;

// WebhookLoadMatch is the typed request payload for Webhook.load.
typedef struct {
  char*account_id;
  char*id;
} WebhookLoadMatch;

// WebhookListMatch is the typed request payload for Webhook.list.
typedef struct {
  char*account_id;
} WebhookListMatch;

// WebhookCreateData is the typed request payload for Webhook.create.
typedef struct {
  char*account_id;
} WebhookCreateData;

// WebhookUpdateData is the typed request payload for Webhook.update.
typedef struct {
  char*account_id;
  char*id;
} WebhookUpdateData;

// WebhookRemoveMatch is the typed request payload for Webhook.remove.
typedef struct {
  char*account_id;
  char*id;
} WebhookRemoveMatch;

#endif // BLUEFINPAYCONEX_ENTITY_TYPES_H
