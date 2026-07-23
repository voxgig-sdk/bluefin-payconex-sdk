// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface AccountUpdater {
}

export interface AccountUpdaterRemoveMatch {
  account_id: string
  record_id?: string
  subscription_id: string
}

export interface AccountUpdaterSchedule {
  enabled?: boolean
  period_date?: string
  period_id: string
  response_format?: string
  token: any[]
}

export interface AccountUpdaterScheduleCreateData {
  account_id: string
}

export interface AccountUpdaterScheduleWithResult {
  card: any[]
  created_at: string
  enabled?: boolean
  expiry?: string
  id: string
  most_recent_update?: Record<string, any>
  period_date?: string
  period_id: string
  response_format?: string
  token: any[]
  type: string
  updated_at: string
}

export interface AccountUpdaterScheduleWithResultListMatch {
  account_id: string
  schedule_id: string
}

export interface AccountUpdaterScheduleWithResultCreateData {
  account_id: string
}

export interface AccountUpdaterSubscriptionWithResult {
  created_at?: string
  enabled?: boolean
  id?: string
  period_date?: string
  period_id?: string
  record?: any[]
  response_format?: string
  template_ref?: string
  updated_at?: string
}

export interface AccountUpdaterSubscriptionWithResultLoadMatch {
  account_id: string
  subscription_id: string
}

export interface AccountUpdaterSubscriptionWithResultCreateData {
  account_id: string
  subscription_id: string
}

export interface AccountUpdaterSubscriptionWithResultUpdateData {
  account_id: string
  subscription_id: string
}

export interface AccountUpdaterUpdate {
  account_updater_schedule_record_id?: string
  format?: string
  id?: string
  new_expiry?: string
  new_token?: string
  old_expiry?: string
  old_token?: string
  recurring_schedule?: any[]
  status?: string
  update_id?: string
  updated_at?: string
}

export interface AccountUpdaterUpdateLoadMatch {
  account_id: string
  id: string
}

export interface ApiKey {
  account?: any[]
  enabled?: boolean
  expires_at?: string
  expires_in?: string
  id?: string
  label?: string
  method?: any[]
  scope?: any[]
  secret?: string
}

export interface ApiKeyLoadMatch {
  account_id: string
  id: string
}

export interface ApiKeyListMatch {
  account_id: string
}

export interface ApiKeyCreateData {
  account_id: string
}

export interface ApiKeyUpdateData {
  account_id: string
  id: string
}

export interface ApiKeyRemoveMatch {
  account_id: string
  id: string
}

export interface ApplePayMerchantDetail {
  domain: any[]
  merchant_url: string
  partner_merchant_name?: string
  payconex_account_id: string
}

export interface ApplePayMerchantDetailListMatch {
  account_id: number
}

export interface ApplePayMerchantDetailCreateData {
  account_id: number
}

export interface ApplePaySession {
  display_name?: string
  domain_name?: string
  epoch_timestamp?: number
  expires_at?: number
  merchant_identifier?: string
  merchant_session_identifier?: string
  nonce?: number
  operational_analytics_identifier?: string
  referrer: string
  retry?: number
  signature?: string
}

export interface ApplePaySessionCreateData {
  account_id: number
}

export interface DynamicDescriptor {
  city?: string
  descriptor?: string
  id?: string
  name?: string
  state?: string
}

export interface DynamicDescriptorLoadMatch {
  account_id: string
  id: string
}

export interface DynamicDescriptorListMatch {
  account_id: string
}

export interface DynamicDescriptorCreateData {
  account_id: string
}

export interface DynamicDescriptorUpdateData {
  account_id: string
  id: string
}

export interface DynamicDescriptorRemoveMatch {
  account_id: string
  id: string
}

export interface IFrameCreateInstance {
  amount?: string
  currency?: string
  customer?: Record<string, any>
  initialize_transaction?: boolean
  label: string
  language?: string
  reference?: string
  timeout?: number
  token?: any[]
}

export interface IFrameCreateInstanceCreateData {
  account_id: string
  payment_iframe_id: string
}

export interface IFrameInstance {
}

export interface IFrameInstanceLoadMatch {
  account_id: string
  id: string
  payment_iframe_id: string
}

export interface Iframe {
  ach_setting?: Record<string, any>
  allowed_parent_domain: any[]
  allowed_payment_method: any[]
  card_setting?: Record<string, any>
  click_to_pay_setting?: Record<string, any>
  currency?: string
  id?: string
  label: string
  language?: string
  timeout?: number
}

export interface IframeLoadMatch {
  account_id: string
  iframe_id: string
}

export interface IframeListMatch {
  account_id: string
}

export interface IframeCreateData {
  account_id: string
}

export interface IframeUpdateData {
  account_id: string
  iframe_id: string
}

export interface Init {
  customer?: Record<string, any>
  description?: string
  item?: any[]
  level2?: Record<string, any>
  level3?: Record<string, any>
  shipping_address: Record<string, any>
  trace?: Record<string, any>
}

export interface InitCreateData {
  account_id: string
}

export interface ListApiKeyScopesEntry {
  category?: string
  description?: string
  enabled?: boolean
  level?: number
  scope?: string
}

export interface ListApiKeyScopesEntryListMatch {
  category?: string
  description?: string
  enabled?: boolean
  level?: number
  scope?: string
}

export interface PaymentIframe {
}

export interface PaymentIframeRemoveMatch {
  account_id: string
  id: string
}

export interface ThreeDSecureAuth {
  browser: Record<string, any>
  card: Record<string, any>
  challenge?: Record<string, any>
  customer?: Record<string, any>
  purchase: Record<string, any>
  server_transaction_id?: string
  shipping: Record<string, any>
  status?: string
  three_d_secure_challenge_indicator?: string
  three_d_secure_id?: string
  trace?: Record<string, any>
}

export interface ThreeDSecureAuthCreateData {
  "3_d_id": string
  account_id: string
}

export interface ThreeDSecureBrowserInit {
  acs_result_url?: string
  acs_url?: string
  cvv?: string
  expiry: string
  pan: string
  payment_details_reference?: string
  server_transaction_id?: string
  status?: string
  three_d_secure_data?: string
  three_d_secure_id?: string
}

export interface ThreeDSecureBrowserInitCreateData {
  account_id: string
}

export interface ThreeDSecureStatus {
  error?: Record<string, any>
  info?: Record<string, any>
  server_transaction_id?: string
  status?: string
  three_d_secure?: Record<string, any>
  three_d_secure_id?: string
}

export interface ThreeDSecureStatusLoadMatch {
  "3_d_id": string
  account_id: string
}

export interface TransactionDetail {
  amount: Record<string, any>
  auth: Record<string, any>
  card?: Record<string, any>
  customer?: Record<string, any>
  description?: string
  id?: string
  item?: any[]
  level2?: Record<string, any>
  level3?: Record<string, any>
  override?: Record<string, any>
  shipping_address: Record<string, any>
  status: string
  timestamp?: string
  trace?: Record<string, any>
}

export interface TransactionDetailLoadMatch {
  account_id: string
  transaction_id: string
}

export interface TransactionDetailUpdateData {
  account_id: string
  transaction_id: string
}

export interface Webhook {
  event: string
  id?: string
  url: string
}

export interface WebhookLoadMatch {
  account_id: string
  id: string
}

export interface WebhookListMatch {
  account_id: string
}

export interface WebhookCreateData {
  account_id: string
}

export interface WebhookUpdateData {
  account_id: string
  id: string
}

export interface WebhookRemoveMatch {
  account_id: string
  id: string
}

