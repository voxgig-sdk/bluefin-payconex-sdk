# frozen_string_literal: true

# Typed models for the BluefinPayconex SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# AccountUpdater entity data model.
class AccountUpdater
end

# Request payload for AccountUpdater#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] record_id
#   @return [String, nil]
#
# @!attribute [rw] subscription_id
#   @return [String]
AccountUpdaterRemoveMatch = Struct.new(
  :account_id,
  :record_id,
  :subscription_id,
  keyword_init: true
)

# AccountUpdaterSchedule entity data model.
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] period_date
#   @return [String, nil]
#
# @!attribute [rw] period_id
#   @return [String]
#
# @!attribute [rw] response_format
#   @return [String, nil]
#
# @!attribute [rw] token
#   @return [Array]
AccountUpdaterSchedule = Struct.new(
  :enabled,
  :period_date,
  :period_id,
  :response_format,
  :token,
  keyword_init: true
)

# Request payload for AccountUpdaterSchedule#create.
#
# @!attribute [rw] account_id
#   @return [String]
AccountUpdaterScheduleCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# AccountUpdaterScheduleWithResult entity data model.
#
# @!attribute [rw] card
#   @return [Array]
#
# @!attribute [rw] created_at
#   @return [String]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] expiry
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] most_recent_update
#   @return [Hash, nil]
#
# @!attribute [rw] period_date
#   @return [String, nil]
#
# @!attribute [rw] period_id
#   @return [String]
#
# @!attribute [rw] response_format
#   @return [String, nil]
#
# @!attribute [rw] token
#   @return [Array]
#
# @!attribute [rw] type
#   @return [String]
#
# @!attribute [rw] updated_at
#   @return [String]
AccountUpdaterScheduleWithResult = Struct.new(
  :card,
  :created_at,
  :enabled,
  :expiry,
  :id,
  :most_recent_update,
  :period_date,
  :period_id,
  :response_format,
  :token,
  :type,
  :updated_at,
  keyword_init: true
)

# Request payload for AccountUpdaterScheduleWithResult#list.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] schedule_id
#   @return [String]
AccountUpdaterScheduleWithResultListMatch = Struct.new(
  :account_id,
  :schedule_id,
  keyword_init: true
)

# Request payload for AccountUpdaterScheduleWithResult#create.
#
# @!attribute [rw] account_id
#   @return [String]
AccountUpdaterScheduleWithResultCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# AccountUpdaterSubscriptionWithResult entity data model.
#
# @!attribute [rw] created_at
#   @return [String, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] period_date
#   @return [String, nil]
#
# @!attribute [rw] period_id
#   @return [String, nil]
#
# @!attribute [rw] record
#   @return [Array, nil]
#
# @!attribute [rw] response_format
#   @return [String, nil]
#
# @!attribute [rw] template_ref
#   @return [String, nil]
#
# @!attribute [rw] updated_at
#   @return [String, nil]
AccountUpdaterSubscriptionWithResult = Struct.new(
  :created_at,
  :enabled,
  :id,
  :period_date,
  :period_id,
  :record,
  :response_format,
  :template_ref,
  :updated_at,
  keyword_init: true
)

# Request payload for AccountUpdaterSubscriptionWithResult#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] subscription_id
#   @return [String]
AccountUpdaterSubscriptionWithResultLoadMatch = Struct.new(
  :account_id,
  :subscription_id,
  keyword_init: true
)

# Request payload for AccountUpdaterSubscriptionWithResult#create.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] subscription_id
#   @return [String]
AccountUpdaterSubscriptionWithResultCreateData = Struct.new(
  :account_id,
  :subscription_id,
  keyword_init: true
)

# Request payload for AccountUpdaterSubscriptionWithResult#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] subscription_id
#   @return [String]
AccountUpdaterSubscriptionWithResultUpdateData = Struct.new(
  :account_id,
  :subscription_id,
  keyword_init: true
)

# AccountUpdaterUpdate entity data model.
#
# @!attribute [rw] account_updater_schedule_record_id
#   @return [String, nil]
#
# @!attribute [rw] format
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] new_expiry
#   @return [String, nil]
#
# @!attribute [rw] new_token
#   @return [String, nil]
#
# @!attribute [rw] old_expiry
#   @return [String, nil]
#
# @!attribute [rw] old_token
#   @return [String, nil]
#
# @!attribute [rw] recurring_schedule
#   @return [Array, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] update_id
#   @return [String, nil]
#
# @!attribute [rw] updated_at
#   @return [String, nil]
AccountUpdaterUpdate = Struct.new(
  :account_updater_schedule_record_id,
  :format,
  :id,
  :new_expiry,
  :new_token,
  :old_expiry,
  :old_token,
  :recurring_schedule,
  :status,
  :update_id,
  :updated_at,
  keyword_init: true
)

# Request payload for AccountUpdaterUpdate#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
AccountUpdaterUpdateLoadMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# ApiKey entity data model.
#
# @!attribute [rw] account
#   @return [Array, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] expires_at
#   @return [String, nil]
#
# @!attribute [rw] expires_in
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] label
#   @return [String, nil]
#
# @!attribute [rw] method
#   @return [Array, nil]
#
# @!attribute [rw] scope
#   @return [Array, nil]
#
# @!attribute [rw] secret
#   @return [String, nil]
ApiKey = Struct.new(
  :account,
  :enabled,
  :expires_at,
  :expires_in,
  :id,
  :label,
  :method,
  :scope,
  :secret,
  keyword_init: true
)

# Request payload for ApiKey#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
ApiKeyLoadMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for ApiKey#list.
#
# @!attribute [rw] account_id
#   @return [String]
ApiKeyListMatch = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for ApiKey#create.
#
# @!attribute [rw] account_id
#   @return [String]
ApiKeyCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for ApiKey#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
ApiKeyUpdateData = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for ApiKey#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
ApiKeyRemoveMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# ApplePayMerchantDetail entity data model.
#
# @!attribute [rw] domain
#   @return [Array]
#
# @!attribute [rw] merchant_url
#   @return [String]
#
# @!attribute [rw] partner_merchant_name
#   @return [String, nil]
#
# @!attribute [rw] payconex_account_id
#   @return [String]
ApplePayMerchantDetail = Struct.new(
  :domain,
  :merchant_url,
  :partner_merchant_name,
  :payconex_account_id,
  keyword_init: true
)

# Request payload for ApplePayMerchantDetail#list.
#
# @!attribute [rw] account_id
#   @return [Integer]
ApplePayMerchantDetailListMatch = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for ApplePayMerchantDetail#create.
#
# @!attribute [rw] account_id
#   @return [Integer]
ApplePayMerchantDetailCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# ApplePaySession entity data model.
#
# @!attribute [rw] display_name
#   @return [String, nil]
#
# @!attribute [rw] domain_name
#   @return [String, nil]
#
# @!attribute [rw] epoch_timestamp
#   @return [Integer, nil]
#
# @!attribute [rw] expires_at
#   @return [Integer, nil]
#
# @!attribute [rw] merchant_identifier
#   @return [String, nil]
#
# @!attribute [rw] merchant_session_identifier
#   @return [String, nil]
#
# @!attribute [rw] nonce
#   @return [Integer, nil]
#
# @!attribute [rw] operational_analytics_identifier
#   @return [String, nil]
#
# @!attribute [rw] referrer
#   @return [String]
#
# @!attribute [rw] retry
#   @return [Integer, nil]
#
# @!attribute [rw] signature
#   @return [String, nil]
ApplePaySession = Struct.new(
  :display_name,
  :domain_name,
  :epoch_timestamp,
  :expires_at,
  :merchant_identifier,
  :merchant_session_identifier,
  :nonce,
  :operational_analytics_identifier,
  :referrer,
  :retry,
  :signature,
  keyword_init: true
)

# Request payload for ApplePaySession#create.
#
# @!attribute [rw] account_id
#   @return [Integer]
ApplePaySessionCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# DynamicDescriptor entity data model.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] descriptor
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
DynamicDescriptor = Struct.new(
  :city,
  :descriptor,
  :id,
  :name,
  :state,
  keyword_init: true
)

# Request payload for DynamicDescriptor#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
DynamicDescriptorLoadMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for DynamicDescriptor#list.
#
# @!attribute [rw] account_id
#   @return [String]
DynamicDescriptorListMatch = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for DynamicDescriptor#create.
#
# @!attribute [rw] account_id
#   @return [String]
DynamicDescriptorCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for DynamicDescriptor#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
DynamicDescriptorUpdateData = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for DynamicDescriptor#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
DynamicDescriptorRemoveMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# IFrameCreateInstance entity data model.
#
# @!attribute [rw] amount
#   @return [String, nil]
#
# @!attribute [rw] currency
#   @return [String, nil]
#
# @!attribute [rw] customer
#   @return [Hash, nil]
#
# @!attribute [rw] initialize_transaction
#   @return [Boolean, nil]
#
# @!attribute [rw] label
#   @return [String]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] timeout
#   @return [Float, nil]
#
# @!attribute [rw] token
#   @return [Array, nil]
IFrameCreateInstance = Struct.new(
  :amount,
  :currency,
  :customer,
  :initialize_transaction,
  :label,
  :language,
  :reference,
  :timeout,
  :token,
  keyword_init: true
)

# Request payload for IFrameCreateInstance#create.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] payment_iframe_id
#   @return [String]
IFrameCreateInstanceCreateData = Struct.new(
  :account_id,
  :payment_iframe_id,
  keyword_init: true
)

# IFrameInstance entity data model.
class IFrameInstance
end

# Request payload for IFrameInstance#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] payment_iframe_id
#   @return [String]
IFrameInstanceLoadMatch = Struct.new(
  :account_id,
  :id,
  :payment_iframe_id,
  keyword_init: true
)

# Iframe entity data model.
#
# @!attribute [rw] ach_setting
#   @return [Hash, nil]
#
# @!attribute [rw] allowed_parent_domain
#   @return [Array]
#
# @!attribute [rw] allowed_payment_method
#   @return [Array]
#
# @!attribute [rw] card_setting
#   @return [Hash, nil]
#
# @!attribute [rw] click_to_pay_setting
#   @return [Hash, nil]
#
# @!attribute [rw] currency
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] label
#   @return [String]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] timeout
#   @return [Float, nil]
Iframe = Struct.new(
  :ach_setting,
  :allowed_parent_domain,
  :allowed_payment_method,
  :card_setting,
  :click_to_pay_setting,
  :currency,
  :id,
  :label,
  :language,
  :timeout,
  keyword_init: true
)

# Request payload for Iframe#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] iframe_id
#   @return [String]
IframeLoadMatch = Struct.new(
  :account_id,
  :iframe_id,
  keyword_init: true
)

# Request payload for Iframe#list.
#
# @!attribute [rw] account_id
#   @return [String]
IframeListMatch = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for Iframe#create.
#
# @!attribute [rw] account_id
#   @return [String]
IframeCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for Iframe#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] iframe_id
#   @return [String]
IframeUpdateData = Struct.new(
  :account_id,
  :iframe_id,
  keyword_init: true
)

# Init entity data model.
#
# @!attribute [rw] customer
#   @return [Hash, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] item
#   @return [Array, nil]
#
# @!attribute [rw] level2
#   @return [Hash, nil]
#
# @!attribute [rw] level3
#   @return [Hash, nil]
#
# @!attribute [rw] shipping_address
#   @return [Hash]
#
# @!attribute [rw] trace
#   @return [Hash, nil]
Init = Struct.new(
  :customer,
  :description,
  :item,
  :level2,
  :level3,
  :shipping_address,
  :trace,
  keyword_init: true
)

# Request payload for Init#create.
#
# @!attribute [rw] account_id
#   @return [String]
InitCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# ListApiKeyScopesEntry entity data model.
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] level
#   @return [Integer, nil]
#
# @!attribute [rw] scope
#   @return [String, nil]
ListApiKeyScopesEntry = Struct.new(
  :category,
  :description,
  :enabled,
  :level,
  :scope,
  keyword_init: true
)

# Request payload for ListApiKeyScopesEntry#list.
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] level
#   @return [Integer, nil]
#
# @!attribute [rw] scope
#   @return [String, nil]
ListApiKeyScopesEntryListMatch = Struct.new(
  :category,
  :description,
  :enabled,
  :level,
  :scope,
  keyword_init: true
)

# PaymentIframe entity data model.
class PaymentIframe
end

# Request payload for PaymentIframe#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
PaymentIframeRemoveMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# ThreeDSecureAuth entity data model.
#
# @!attribute [rw] browser
#   @return [Hash]
#
# @!attribute [rw] card
#   @return [Hash]
#
# @!attribute [rw] challenge
#   @return [Hash, nil]
#
# @!attribute [rw] customer
#   @return [Hash, nil]
#
# @!attribute [rw] purchase
#   @return [Hash]
#
# @!attribute [rw] server_transaction_id
#   @return [String, nil]
#
# @!attribute [rw] shipping
#   @return [Hash]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] three_d_secure_challenge_indicator
#   @return [String, nil]
#
# @!attribute [rw] three_d_secure_id
#   @return [String, nil]
#
# @!attribute [rw] trace
#   @return [Hash, nil]
ThreeDSecureAuth = Struct.new(
  :browser,
  :card,
  :challenge,
  :customer,
  :purchase,
  :server_transaction_id,
  :shipping,
  :status,
  :three_d_secure_challenge_indicator,
  :three_d_secure_id,
  :trace,
  keyword_init: true
)

# Request payload for ThreeDSecureAuth#create.
#
# @!attribute [rw] 3_d_id
#   @return [String]
#
# @!attribute [rw] account_id
#   @return [String]
ThreeDSecureAuthCreateData = Struct.new(
  :"3_d_id",
  :account_id,
  keyword_init: true
)

# ThreeDSecureBrowserInit entity data model.
#
# @!attribute [rw] acs_result_url
#   @return [String, nil]
#
# @!attribute [rw] acs_url
#   @return [String, nil]
#
# @!attribute [rw] cvv
#   @return [String, nil]
#
# @!attribute [rw] expiry
#   @return [String]
#
# @!attribute [rw] pan
#   @return [String]
#
# @!attribute [rw] payment_details_reference
#   @return [String, nil]
#
# @!attribute [rw] server_transaction_id
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] three_d_secure_data
#   @return [String, nil]
#
# @!attribute [rw] three_d_secure_id
#   @return [String, nil]
ThreeDSecureBrowserInit = Struct.new(
  :acs_result_url,
  :acs_url,
  :cvv,
  :expiry,
  :pan,
  :payment_details_reference,
  :server_transaction_id,
  :status,
  :three_d_secure_data,
  :three_d_secure_id,
  keyword_init: true
)

# Request payload for ThreeDSecureBrowserInit#create.
#
# @!attribute [rw] account_id
#   @return [String]
ThreeDSecureBrowserInitCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# ThreeDSecureStatus entity data model.
#
# @!attribute [rw] error
#   @return [Hash, nil]
#
# @!attribute [rw] info
#   @return [Hash, nil]
#
# @!attribute [rw] server_transaction_id
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] three_d_secure
#   @return [Hash, nil]
#
# @!attribute [rw] three_d_secure_id
#   @return [String, nil]
ThreeDSecureStatus = Struct.new(
  :error,
  :info,
  :server_transaction_id,
  :status,
  :three_d_secure,
  :three_d_secure_id,
  keyword_init: true
)

# Request payload for ThreeDSecureStatus#load.
#
# @!attribute [rw] 3_d_id
#   @return [String]
#
# @!attribute [rw] account_id
#   @return [String]
ThreeDSecureStatusLoadMatch = Struct.new(
  :"3_d_id",
  :account_id,
  keyword_init: true
)

# TransactionDetail entity data model.
#
# @!attribute [rw] amount
#   @return [Hash]
#
# @!attribute [rw] auth
#   @return [Hash]
#
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] customer
#   @return [Hash, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
#   @return [Array, nil]
#
# @!attribute [rw] level2
#   @return [Hash, nil]
#
# @!attribute [rw] level3
#   @return [Hash, nil]
#
# @!attribute [rw] override
#   @return [Hash, nil]
#
# @!attribute [rw] shipping_address
#   @return [Hash]
#
# @!attribute [rw] status
#   @return [String]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] trace
#   @return [Hash, nil]
TransactionDetail = Struct.new(
  :amount,
  :auth,
  :card,
  :customer,
  :description,
  :id,
  :item,
  :level2,
  :level3,
  :override,
  :shipping_address,
  :status,
  :timestamp,
  :trace,
  keyword_init: true
)

# Request payload for TransactionDetail#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] transaction_id
#   @return [String]
TransactionDetailLoadMatch = Struct.new(
  :account_id,
  :transaction_id,
  keyword_init: true
)

# Request payload for TransactionDetail#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] transaction_id
#   @return [String]
TransactionDetailUpdateData = Struct.new(
  :account_id,
  :transaction_id,
  keyword_init: true
)

# Webhook entity data model.
#
# @!attribute [rw] event
#   @return [String]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] url
#   @return [String]
Webhook = Struct.new(
  :event,
  :id,
  :url,
  keyword_init: true
)

# Request payload for Webhook#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
WebhookLoadMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for Webhook#list.
#
# @!attribute [rw] account_id
#   @return [String]
WebhookListMatch = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for Webhook#create.
#
# @!attribute [rw] account_id
#   @return [String]
WebhookCreateData = Struct.new(
  :account_id,
  keyword_init: true
)

# Request payload for Webhook#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
WebhookUpdateData = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

# Request payload for Webhook#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
WebhookRemoveMatch = Struct.new(
  :account_id,
  :id,
  keyword_init: true
)

