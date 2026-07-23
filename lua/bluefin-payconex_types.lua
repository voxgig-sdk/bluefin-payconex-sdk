-- Typed models for the BluefinPayconex SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class AccountUpdater

---@class AccountUpdaterRemoveMatch
---@field account_id string
---@field record_id? string
---@field subscription_id string

---@class AccountUpdaterSchedule
---@field enabled? boolean
---@field period_date? string
---@field period_id string
---@field response_format? string
---@field token table

---@class AccountUpdaterScheduleCreateData
---@field account_id string

---@class AccountUpdaterScheduleWithResult
---@field card table
---@field created_at string
---@field enabled? boolean
---@field expiry? string
---@field id string
---@field most_recent_update? table
---@field period_date? string
---@field period_id string
---@field response_format? string
---@field token table
---@field type string
---@field updated_at string

---@class AccountUpdaterScheduleWithResultListMatch
---@field account_id string
---@field schedule_id string

---@class AccountUpdaterScheduleWithResultCreateData
---@field account_id string

---@class AccountUpdaterSubscriptionWithResult
---@field created_at? string
---@field enabled? boolean
---@field id? string
---@field period_date? string
---@field period_id? string
---@field record? table
---@field response_format? string
---@field template_ref? string
---@field updated_at? string

---@class AccountUpdaterSubscriptionWithResultLoadMatch
---@field account_id string
---@field subscription_id string

---@class AccountUpdaterSubscriptionWithResultCreateData
---@field account_id string
---@field subscription_id string

---@class AccountUpdaterSubscriptionWithResultUpdateData
---@field account_id string
---@field subscription_id string

---@class AccountUpdaterUpdate
---@field account_updater_schedule_record_id? string
---@field format? string
---@field id? string
---@field new_expiry? string
---@field new_token? string
---@field old_expiry? string
---@field old_token? string
---@field recurring_schedule? table
---@field status? string
---@field update_id? string
---@field updated_at? string

---@class AccountUpdaterUpdateLoadMatch
---@field account_id string
---@field id string

---@class ApiKey
---@field account? table
---@field enabled? boolean
---@field expires_at? string
---@field expires_in? string
---@field id? string
---@field label? string
---@field method? table
---@field scope? table
---@field secret? string

---@class ApiKeyLoadMatch
---@field account_id string
---@field id string

---@class ApiKeyListMatch
---@field account_id string

---@class ApiKeyCreateData
---@field account_id string

---@class ApiKeyUpdateData
---@field account_id string
---@field id string

---@class ApiKeyRemoveMatch
---@field account_id string
---@field id string

---@class ApplePayMerchantDetail
---@field domain table
---@field merchant_url string
---@field partner_merchant_name? string
---@field payconex_account_id string

---@class ApplePayMerchantDetailListMatch
---@field account_id number

---@class ApplePayMerchantDetailCreateData
---@field account_id number

---@class ApplePaySession
---@field display_name? string
---@field domain_name? string
---@field epoch_timestamp? number
---@field expires_at? number
---@field merchant_identifier? string
---@field merchant_session_identifier? string
---@field nonce? number
---@field operational_analytics_identifier? string
---@field referrer string
---@field retry? number
---@field signature? string

---@class ApplePaySessionCreateData
---@field account_id number

---@class DynamicDescriptor
---@field city? string
---@field descriptor? string
---@field id? string
---@field name? string
---@field state? string

---@class DynamicDescriptorLoadMatch
---@field account_id string
---@field id string

---@class DynamicDescriptorListMatch
---@field account_id string

---@class DynamicDescriptorCreateData
---@field account_id string

---@class DynamicDescriptorUpdateData
---@field account_id string
---@field id string

---@class DynamicDescriptorRemoveMatch
---@field account_id string
---@field id string

---@class IFrameCreateInstance
---@field amount? string
---@field currency? string
---@field customer? table
---@field initialize_transaction? boolean
---@field label string
---@field language? string
---@field reference? string
---@field timeout? number
---@field token? table

---@class IFrameCreateInstanceCreateData
---@field account_id string
---@field payment_iframe_id string

---@class IFrameInstance

---@class IFrameInstanceLoadMatch
---@field account_id string
---@field id string
---@field payment_iframe_id string

---@class Iframe
---@field ach_setting? table
---@field allowed_parent_domain table
---@field allowed_payment_method table
---@field card_setting? table
---@field click_to_pay_setting? table
---@field currency? string
---@field id? string
---@field label string
---@field language? string
---@field timeout? number

---@class IframeLoadMatch
---@field account_id string
---@field iframe_id string

---@class IframeListMatch
---@field account_id string

---@class IframeCreateData
---@field account_id string

---@class IframeUpdateData
---@field account_id string
---@field iframe_id string

---@class Init
---@field customer? table
---@field description? string
---@field item? table
---@field level2? table
---@field level3? table
---@field shipping_address table
---@field trace? table

---@class InitCreateData
---@field account_id string

---@class ListApiKeyScopesEntry
---@field category? string
---@field description? string
---@field enabled? boolean
---@field level? number
---@field scope? string

---@class ListApiKeyScopesEntryListMatch
---@field category? string
---@field description? string
---@field enabled? boolean
---@field level? number
---@field scope? string

---@class PaymentIframe

---@class PaymentIframeRemoveMatch
---@field account_id string
---@field id string

---@class ThreeDSecureAuth
---@field browser table
---@field card table
---@field challenge? table
---@field customer? table
---@field purchase table
---@field server_transaction_id? string
---@field shipping table
---@field status? string
---@field three_d_secure_challenge_indicator? string
---@field three_d_secure_id? string
---@field trace? table

---@class ThreeDSecureAuthCreateData
---@field ["3_d_id"] string
---@field account_id string

---@class ThreeDSecureBrowserInit
---@field acs_result_url? string
---@field acs_url? string
---@field cvv? string
---@field expiry string
---@field pan string
---@field payment_details_reference? string
---@field server_transaction_id? string
---@field status? string
---@field three_d_secure_data? string
---@field three_d_secure_id? string

---@class ThreeDSecureBrowserInitCreateData
---@field account_id string

---@class ThreeDSecureStatus
---@field error? table
---@field info? table
---@field server_transaction_id? string
---@field status? string
---@field three_d_secure? table
---@field three_d_secure_id? string

---@class ThreeDSecureStatusLoadMatch
---@field ["3_d_id"] string
---@field account_id string

---@class TransactionDetail
---@field amount table
---@field auth table
---@field card? table
---@field customer? table
---@field description? string
---@field id? string
---@field item? table
---@field level2? table
---@field level3? table
---@field override? table
---@field shipping_address table
---@field status string
---@field timestamp? string
---@field trace? table

---@class TransactionDetailLoadMatch
---@field account_id string
---@field transaction_id string

---@class TransactionDetailUpdateData
---@field account_id string
---@field transaction_id string

---@class Webhook
---@field event string
---@field id? string
---@field url string

---@class WebhookLoadMatch
---@field account_id string
---@field id string

---@class WebhookListMatch
---@field account_id string

---@class WebhookCreateData
---@field account_id string

---@class WebhookUpdateData
---@field account_id string
---@field id string

---@class WebhookRemoveMatch
---@field account_id string
---@field id string

local M = {}

return M
