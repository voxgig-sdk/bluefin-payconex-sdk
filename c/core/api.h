// BluefinPayconex SDK public API (generated).

#ifndef BLUEFINPAYCONEX_API_H
#define BLUEFINPAYCONEX_API_H

#include "sdk.h"

// AccountUpdater entity.
Entity* account_updater_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_account_updater(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* account_updater_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// AccountUpdaterSchedule entity.
Entity* account_updater_schedule_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_account_updater_schedule(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* account_updater_schedule_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// AccountUpdaterScheduleWithResult entity.
Entity* account_updater_schedule_with_result_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_account_updater_schedule_with_result(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* account_updater_schedule_with_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// AccountUpdaterSubscriptionWithResult entity.
Entity* account_updater_subscription_with_result_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_account_updater_subscription_with_result(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* account_updater_subscription_with_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// AccountUpdaterUpdate entity.
Entity* account_updater_update_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_account_updater_update(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* account_updater_update_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ApiKey entity.
Entity* api_key_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_api_key(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* api_key_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ApplePayMerchantDetail entity.
Entity* apple_pay_merchant_detail_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_apple_pay_merchant_detail(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* apple_pay_merchant_detail_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ApplePaySession entity.
Entity* apple_pay_session_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_apple_pay_session(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* apple_pay_session_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DynamicDescriptor entity.
Entity* dynamic_descriptor_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_dynamic_descriptor(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* dynamic_descriptor_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// IFrameCreateInstance entity.
Entity* i_frame_create_instance_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_i_frame_create_instance(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* i_frame_create_instance_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// IFrameInstance entity.
Entity* i_frame_instance_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_i_frame_instance(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* i_frame_instance_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Iframe entity.
Entity* iframe_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_iframe(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* iframe_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Init entity.
Entity* init_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_init(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* init_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ListApiKeyScopesEntry entity.
Entity* list_api_key_scopes_entry_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_list_api_key_scopes_entry(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* list_api_key_scopes_entry_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// PaymentIframe entity.
Entity* payment_iframe_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_payment_iframe(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* payment_iframe_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ThreeDSecureAuth entity.
Entity* three_d_secure_auth_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_three_d_secure_auth(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* three_d_secure_auth_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ThreeDSecureBrowserInit entity.
Entity* three_d_secure_browser_init_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_three_d_secure_browser_init(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* three_d_secure_browser_init_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// ThreeDSecureStatus entity.
Entity* three_d_secure_status_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_three_d_secure_status(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* three_d_secure_status_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// TransactionDetail entity.
Entity* transaction_detail_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_transaction_detail(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* transaction_detail_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Webhook entity.
Entity* webhook_entity_new(BluefinPayconexSDK* client, voxgig_value* entopts);
Entity* bluefinpayconex_webhook(BluefinPayconexSDK* client, voxgig_value* entopts);
voxgig_value* webhook_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFINPAYCONEX_API_H
