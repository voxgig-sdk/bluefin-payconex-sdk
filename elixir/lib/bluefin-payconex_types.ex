# Typed models for the BluefinPayconex SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels. The SDK carries data as string-keyed struct value
# nodes, so each alias is an open string-keyed map; the @typedoc member lists
# document the concrete shapes. Do not edit by hand.

defmodule BluefinPayconex.Types do
  @moduledoc """
  Documented shapes for the BluefinPayconex SDK entities and operation payloads.

  Every alias resolves to an open string-keyed map because the SDK carries
  data as string-keyed struct value nodes; consult each type's member list for
  the concrete field/param types.
  """

  @typedoc """
  AccountUpdater entity data model.
  """
  @type account_updater :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdater remove.

  Members:
    * `"account_id"` — String.t() (required)
    * `"record_id"` — String.t() (optional)
    * `"subscription_id"` — String.t() (required)
  """
  @type account_updater_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  AccountUpdaterSchedule entity data model.

  Members:
    * `"enabled"` — boolean() (optional)
    * `"period_date"` — String.t() (optional)
    * `"period_id"` — String.t() (required)
    * `"response_format"` — String.t() (optional)
    * `"token"` — list() (required)
  """
  @type account_updater_schedule :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterSchedule create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type account_updater_schedule_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  AccountUpdaterScheduleWithResult entity data model.

  Members:
    * `"card"` — list() (required)
    * `"created_at"` — String.t() (required)
    * `"enabled"` — boolean() (optional)
    * `"expiry"` — String.t() (optional)
    * `"id"` — String.t() (required)
    * `"most_recent_update"` — map() (optional)
    * `"period_date"` — String.t() (optional)
    * `"period_id"` — String.t() (required)
    * `"response_format"` — String.t() (optional)
    * `"token"` — list() (required)
    * `"type"` — String.t() (required)
    * `"updated_at"` — String.t() (required)
  """
  @type account_updater_schedule_with_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterScheduleWithResult list.

  Members:
    * `"account_id"` — String.t() (required)
    * `"schedule_id"` — String.t() (required)
  """
  @type account_updater_schedule_with_result_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterScheduleWithResult create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type account_updater_schedule_with_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  AccountUpdaterSubscriptionWithResult entity data model.

  Members:
    * `"created_at"` — String.t() (optional)
    * `"enabled"` — boolean() (optional)
    * `"id"` — String.t() (optional)
    * `"period_date"` — String.t() (optional)
    * `"period_id"` — String.t() (optional)
    * `"record"` — list() (optional)
    * `"response_format"` — String.t() (optional)
    * `"template_ref"` — String.t() (optional)
    * `"updated_at"` — String.t() (optional)
  """
  @type account_updater_subscription_with_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterSubscriptionWithResult load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"subscription_id"` — String.t() (required)
  """
  @type account_updater_subscription_with_result_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterSubscriptionWithResult create.

  Members:
    * `"account_id"` — String.t() (required)
    * `"subscription_id"` — String.t() (required)
  """
  @type account_updater_subscription_with_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterSubscriptionWithResult update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"subscription_id"` — String.t() (required)
  """
  @type account_updater_subscription_with_result_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  AccountUpdaterUpdate entity data model.

  Members:
    * `"account_updater_schedule_record_id"` — String.t() (optional)
    * `"format"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"new_expiry"` — String.t() (optional)
    * `"new_token"` — String.t() (optional)
    * `"old_expiry"` — String.t() (optional)
    * `"old_token"` — String.t() (optional)
    * `"recurring_schedule"` — list() (optional)
    * `"status"` — String.t() (optional)
    * `"update_id"` — String.t() (optional)
    * `"updated_at"` — String.t() (optional)
  """
  @type account_updater_update :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for AccountUpdaterUpdate load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type account_updater_update_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  ApiKey entity data model.

  Members:
    * `"account"` — list() (optional)
    * `"enabled"` — boolean() (optional)
    * `"expires_at"` — String.t() (optional)
    * `"expires_in"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"label"` — String.t() (optional)
    * `"method"` — list() (optional)
    * `"scope"` — list() (optional)
    * `"secret"` — String.t() (optional)
  """
  @type api_key :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApiKey load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type api_key_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApiKey list.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type api_key_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApiKey create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type api_key_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApiKey update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type api_key_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApiKey remove.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type api_key_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  ApplePayMerchantDetail entity data model.

  Members:
    * `"domain"` — list() (required)
    * `"merchant_url"` — String.t() (required)
    * `"partner_merchant_name"` — String.t() (optional)
    * `"payconex_account_id"` — String.t() (required)
  """
  @type apple_pay_merchant_detail :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApplePayMerchantDetail list.

  Members:
    * `"account_id"` — integer() (required)
  """
  @type apple_pay_merchant_detail_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApplePayMerchantDetail create.

  Members:
    * `"account_id"` — integer() (required)
  """
  @type apple_pay_merchant_detail_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  ApplePaySession entity data model.

  Members:
    * `"display_name"` — String.t() (optional)
    * `"domain_name"` — String.t() (optional)
    * `"epoch_timestamp"` — integer() (optional)
    * `"expires_at"` — integer() (optional)
    * `"merchant_identifier"` — String.t() (optional)
    * `"merchant_session_identifier"` — String.t() (optional)
    * `"nonce"` — integer() (optional)
    * `"operational_analytics_identifier"` — String.t() (optional)
    * `"referrer"` — String.t() (required)
    * `"retry"` — integer() (optional)
    * `"signature"` — String.t() (optional)
  """
  @type apple_pay_session :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ApplePaySession create.

  Members:
    * `"account_id"` — integer() (required)
  """
  @type apple_pay_session_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  DynamicDescriptor entity data model.

  Members:
    * `"city"` — String.t() (optional)
    * `"descriptor"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"state"` — String.t() (optional)
  """
  @type dynamic_descriptor :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DynamicDescriptor load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type dynamic_descriptor_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DynamicDescriptor list.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type dynamic_descriptor_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DynamicDescriptor create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type dynamic_descriptor_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DynamicDescriptor update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type dynamic_descriptor_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DynamicDescriptor remove.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type dynamic_descriptor_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  IFrameCreateInstance entity data model.

  Members:
    * `"amount"` — String.t() (optional)
    * `"currency"` — String.t() (optional)
    * `"customer"` — map() (optional)
    * `"initialize_transaction"` — boolean() (optional)
    * `"label"` — String.t() (required)
    * `"language"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"timeout"` — float() (optional)
    * `"token"` — list() (optional)
  """
  @type i_frame_create_instance :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for IFrameCreateInstance create.

  Members:
    * `"account_id"` — String.t() (required)
    * `"payment_iframe_id"` — String.t() (required)
  """
  @type i_frame_create_instance_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  IFrameInstance entity data model.
  """
  @type i_frame_instance :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for IFrameInstance load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
    * `"payment_iframe_id"` — String.t() (required)
  """
  @type i_frame_instance_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Iframe entity data model.

  Members:
    * `"ach_setting"` — map() (optional)
    * `"allowed_parent_domain"` — list() (required)
    * `"allowed_payment_method"` — list() (required)
    * `"card_setting"` — map() (optional)
    * `"click_to_pay_setting"` — map() (optional)
    * `"currency"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"label"` — String.t() (required)
    * `"language"` — String.t() (optional)
    * `"timeout"` — float() (optional)
  """
  @type iframe :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Iframe load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"iframe_id"` — String.t() (required)
  """
  @type iframe_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Iframe list.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type iframe_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Iframe create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type iframe_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Iframe update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"iframe_id"` — String.t() (required)
  """
  @type iframe_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  Init entity data model.

  Members:
    * `"customer"` — map() (optional)
    * `"description"` — String.t() (optional)
    * `"item"` — list() (optional)
    * `"level2"` — map() (optional)
    * `"level3"` — map() (optional)
    * `"shipping_address"` — map() (required)
    * `"trace"` — map() (optional)
  """
  @type init :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Init create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type init_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  ListApiKeyScopesEntry entity data model.

  Members:
    * `"category"` — String.t() (optional)
    * `"description"` — String.t() (optional)
    * `"enabled"` — boolean() (optional)
    * `"level"` — integer() (optional)
    * `"scope"` — String.t() (optional)
  """
  @type list_api_key_scopes_entry :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ListApiKeyScopesEntry list.

  Members:
    * `"category"` — String.t() (optional)
    * `"description"` — String.t() (optional)
    * `"enabled"` — boolean() (optional)
    * `"level"` — integer() (optional)
    * `"scope"` — String.t() (optional)
  """
  @type list_api_key_scopes_entry_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  PaymentIframe entity data model.
  """
  @type payment_iframe :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for PaymentIframe remove.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type payment_iframe_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  ThreeDSecureAuth entity data model.

  Members:
    * `"browser"` — map() (required)
    * `"card"` — map() (required)
    * `"challenge"` — map() (optional)
    * `"customer"` — map() (optional)
    * `"purchase"` — map() (required)
    * `"server_transaction_id"` — String.t() (optional)
    * `"shipping"` — map() (required)
    * `"status"` — String.t() (optional)
    * `"three_d_secure_challenge_indicator"` — String.t() (optional)
    * `"three_d_secure_id"` — String.t() (optional)
    * `"trace"` — map() (optional)
  """
  @type three_d_secure_auth :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ThreeDSecureAuth create.

  Members:
    * `"3_d_id"` — String.t() (required)
    * `"account_id"` — String.t() (required)
  """
  @type three_d_secure_auth_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  ThreeDSecureBrowserInit entity data model.

  Members:
    * `"acs_result_url"` — String.t() (optional)
    * `"acs_url"` — String.t() (optional)
    * `"cvv"` — String.t() (optional)
    * `"expiry"` — String.t() (required)
    * `"pan"` — String.t() (required)
    * `"payment_details_reference"` — String.t() (optional)
    * `"server_transaction_id"` — String.t() (optional)
    * `"status"` — String.t() (optional)
    * `"three_d_secure_data"` — String.t() (optional)
    * `"three_d_secure_id"` — String.t() (optional)
  """
  @type three_d_secure_browser_init :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ThreeDSecureBrowserInit create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type three_d_secure_browser_init_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  ThreeDSecureStatus entity data model.

  Members:
    * `"error"` — map() (optional)
    * `"info"` — map() (optional)
    * `"server_transaction_id"` — String.t() (optional)
    * `"status"` — String.t() (optional)
    * `"three_d_secure"` — map() (optional)
    * `"three_d_secure_id"` — String.t() (optional)
  """
  @type three_d_secure_status :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for ThreeDSecureStatus load.

  Members:
    * `"3_d_id"` — String.t() (required)
    * `"account_id"` — String.t() (required)
  """
  @type three_d_secure_status_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  TransactionDetail entity data model.

  Members:
    * `"amount"` — map() (required)
    * `"auth"` — map() (required)
    * `"card"` — map() (optional)
    * `"customer"` — map() (optional)
    * `"description"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"item"` — list() (optional)
    * `"level2"` — map() (optional)
    * `"level3"` — map() (optional)
    * `"override"` — map() (optional)
    * `"shipping_address"` — map() (required)
    * `"status"` — String.t() (required)
    * `"timestamp"` — String.t() (optional)
    * `"trace"` — map() (optional)
  """
  @type transaction_detail :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for TransactionDetail load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"transaction_id"` — String.t() (required)
  """
  @type transaction_detail_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for TransactionDetail update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"transaction_id"` — String.t() (required)
  """
  @type transaction_detail_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  Webhook entity data model.

  Members:
    * `"event"` — String.t() (required)
    * `"id"` — String.t() (optional)
    * `"url"` — String.t() (required)
  """
  @type webhook :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Webhook load.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type webhook_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Webhook list.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type webhook_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Webhook create.

  Members:
    * `"account_id"` — String.t() (required)
  """
  @type webhook_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Webhook update.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type webhook_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Webhook remove.

  Members:
    * `"account_id"` — String.t() (required)
    * `"id"` — String.t() (required)
  """
  @type webhook_remove_match :: %{optional(String.t()) => any()}

end
