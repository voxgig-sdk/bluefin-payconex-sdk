// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// AccountUpdater is the typed data model for the account_updater entity.
type AccountUpdater struct {
}

// AccountUpdaterRemoveMatch is the typed request payload for AccountUpdater.RemoveTyped.
type AccountUpdaterRemoveMatch struct {
	AccountId string `json:"account_id"`
	RecordId *string `json:"record_id,omitempty"`
	SubscriptionId string `json:"subscription_id"`
}

// AccountUpdaterSchedule is the typed data model for the account_updater_schedule entity.
type AccountUpdaterSchedule struct {
	Enabled *bool `json:"enabled,omitempty"`
	PeriodDate *string `json:"period_date,omitempty"`
	PeriodId string `json:"period_id"`
	ResponseFormat *string `json:"response_format,omitempty"`
	Token []any `json:"token"`
}

// AccountUpdaterScheduleCreateData is the typed request payload for AccountUpdaterSchedule.CreateTyped.
type AccountUpdaterScheduleCreateData struct {
	AccountId string `json:"account_id"`
}

// AccountUpdaterScheduleWithResult is the typed data model for the account_updater_schedule_with_result entity.
type AccountUpdaterScheduleWithResult struct {
	Card []any `json:"card"`
	CreatedAt string `json:"created_at"`
	Enabled *bool `json:"enabled,omitempty"`
	Expiry *string `json:"expiry,omitempty"`
	Id string `json:"id"`
	MostRecentUpdate *map[string]any `json:"most_recent_update,omitempty"`
	PeriodDate *string `json:"period_date,omitempty"`
	PeriodId string `json:"period_id"`
	ResponseFormat *string `json:"response_format,omitempty"`
	Token []any `json:"token"`
	Type string `json:"type"`
	UpdatedAt string `json:"updated_at"`
}

// AccountUpdaterScheduleWithResultListMatch is the typed request payload for AccountUpdaterScheduleWithResult.ListTyped.
type AccountUpdaterScheduleWithResultListMatch struct {
	AccountId string `json:"account_id"`
	ScheduleId string `json:"schedule_id"`
}

// AccountUpdaterScheduleWithResultCreateData is the typed request payload for AccountUpdaterScheduleWithResult.CreateTyped.
type AccountUpdaterScheduleWithResultCreateData struct {
	AccountId string `json:"account_id"`
}

// AccountUpdaterSubscriptionWithResult is the typed data model for the account_updater_subscription_with_result entity.
type AccountUpdaterSubscriptionWithResult struct {
	CreatedAt *string `json:"created_at,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Id *string `json:"id,omitempty"`
	PeriodDate *string `json:"period_date,omitempty"`
	PeriodId *string `json:"period_id,omitempty"`
	Record *[]any `json:"record,omitempty"`
	ResponseFormat *string `json:"response_format,omitempty"`
	TemplateRef *string `json:"template_ref,omitempty"`
	UpdatedAt *string `json:"updated_at,omitempty"`
}

// AccountUpdaterSubscriptionWithResultLoadMatch is the typed request payload for AccountUpdaterSubscriptionWithResult.LoadTyped.
type AccountUpdaterSubscriptionWithResultLoadMatch struct {
	AccountId string `json:"account_id"`
	SubscriptionId string `json:"subscription_id"`
}

// AccountUpdaterSubscriptionWithResultCreateData is the typed request payload for AccountUpdaterSubscriptionWithResult.CreateTyped.
type AccountUpdaterSubscriptionWithResultCreateData struct {
	AccountId string `json:"account_id"`
	SubscriptionId string `json:"subscription_id"`
}

// AccountUpdaterSubscriptionWithResultUpdateData is the typed request payload for AccountUpdaterSubscriptionWithResult.UpdateTyped.
type AccountUpdaterSubscriptionWithResultUpdateData struct {
	AccountId string `json:"account_id"`
	SubscriptionId string `json:"subscription_id"`
}

// AccountUpdaterUpdate is the typed data model for the account_updater_update entity.
type AccountUpdaterUpdate struct {
	AccountUpdaterScheduleRecordId *string `json:"account_updater_schedule_record_id,omitempty"`
	Format *string `json:"format,omitempty"`
	Id *string `json:"id,omitempty"`
	NewExpiry *string `json:"new_expiry,omitempty"`
	NewToken *string `json:"new_token,omitempty"`
	OldExpiry *string `json:"old_expiry,omitempty"`
	OldToken *string `json:"old_token,omitempty"`
	RecurringSchedule *[]any `json:"recurring_schedule,omitempty"`
	Status *string `json:"status,omitempty"`
	UpdateId *string `json:"update_id,omitempty"`
	UpdatedAt *string `json:"updated_at,omitempty"`
}

// AccountUpdaterUpdateLoadMatch is the typed request payload for AccountUpdaterUpdate.LoadTyped.
type AccountUpdaterUpdateLoadMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// ApiKey is the typed data model for the api_key entity.
type ApiKey struct {
	Account *[]any `json:"account,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	ExpiresAt *string `json:"expires_at,omitempty"`
	ExpiresIn *string `json:"expires_in,omitempty"`
	Id *string `json:"id,omitempty"`
	Label *string `json:"label,omitempty"`
	Method *[]any `json:"method,omitempty"`
	Scope *[]any `json:"scope,omitempty"`
	Secret *string `json:"secret,omitempty"`
}

// ApiKeyLoadMatch is the typed request payload for ApiKey.LoadTyped.
type ApiKeyLoadMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// ApiKeyListMatch is the typed request payload for ApiKey.ListTyped.
type ApiKeyListMatch struct {
	AccountId string `json:"account_id"`
}

// ApiKeyCreateData is the typed request payload for ApiKey.CreateTyped.
type ApiKeyCreateData struct {
	AccountId string `json:"account_id"`
}

// ApiKeyUpdateData is the typed request payload for ApiKey.UpdateTyped.
type ApiKeyUpdateData struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// ApiKeyRemoveMatch is the typed request payload for ApiKey.RemoveTyped.
type ApiKeyRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// ApplePayMerchantDetail is the typed data model for the apple_pay_merchant_detail entity.
type ApplePayMerchantDetail struct {
	Domain []any `json:"domain"`
	MerchantUrl string `json:"merchant_url"`
	PartnerMerchantName *string `json:"partner_merchant_name,omitempty"`
	PayconexAccountId string `json:"payconex_account_id"`
}

// ApplePayMerchantDetailListMatch is the typed request payload for ApplePayMerchantDetail.ListTyped.
type ApplePayMerchantDetailListMatch struct {
	AccountId int `json:"account_id"`
}

// ApplePayMerchantDetailCreateData is the typed request payload for ApplePayMerchantDetail.CreateTyped.
type ApplePayMerchantDetailCreateData struct {
	AccountId int `json:"account_id"`
}

// ApplePaySession is the typed data model for the apple_pay_session entity.
type ApplePaySession struct {
	DisplayName *string `json:"display_name,omitempty"`
	DomainName *string `json:"domain_name,omitempty"`
	EpochTimestamp *int `json:"epoch_timestamp,omitempty"`
	ExpiresAt *int `json:"expires_at,omitempty"`
	MerchantIdentifier *string `json:"merchant_identifier,omitempty"`
	MerchantSessionIdentifier *string `json:"merchant_session_identifier,omitempty"`
	Nonce *int `json:"nonce,omitempty"`
	OperationalAnalyticsIdentifier *string `json:"operational_analytics_identifier,omitempty"`
	Referrer string `json:"referrer"`
	Retry *int `json:"retry,omitempty"`
	Signature *string `json:"signature,omitempty"`
}

// ApplePaySessionCreateData is the typed request payload for ApplePaySession.CreateTyped.
type ApplePaySessionCreateData struct {
	AccountId int `json:"account_id"`
}

// DynamicDescriptor is the typed data model for the dynamic_descriptor entity.
type DynamicDescriptor struct {
	City *string `json:"city,omitempty"`
	Descriptor *string `json:"descriptor,omitempty"`
	Id *string `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	State *string `json:"state,omitempty"`
}

// DynamicDescriptorLoadMatch is the typed request payload for DynamicDescriptor.LoadTyped.
type DynamicDescriptorLoadMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// DynamicDescriptorListMatch is the typed request payload for DynamicDescriptor.ListTyped.
type DynamicDescriptorListMatch struct {
	AccountId string `json:"account_id"`
}

// DynamicDescriptorCreateData is the typed request payload for DynamicDescriptor.CreateTyped.
type DynamicDescriptorCreateData struct {
	AccountId string `json:"account_id"`
}

// DynamicDescriptorUpdateData is the typed request payload for DynamicDescriptor.UpdateTyped.
type DynamicDescriptorUpdateData struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// DynamicDescriptorRemoveMatch is the typed request payload for DynamicDescriptor.RemoveTyped.
type DynamicDescriptorRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// IFrameCreateInstance is the typed data model for the i_frame_create_instance entity.
type IFrameCreateInstance struct {
	Amount *string `json:"amount,omitempty"`
	Currency *string `json:"currency,omitempty"`
	Customer *map[string]any `json:"customer,omitempty"`
	InitializeTransaction *bool `json:"initialize_transaction,omitempty"`
	Label string `json:"label"`
	Language *string `json:"language,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Timeout *float64 `json:"timeout,omitempty"`
	Token *[]any `json:"token,omitempty"`
}

// IFrameCreateInstanceCreateData is the typed request payload for IFrameCreateInstance.CreateTyped.
type IFrameCreateInstanceCreateData struct {
	AccountId string `json:"account_id"`
	PaymentIframeId string `json:"payment_iframe_id"`
}

// IFrameInstance is the typed data model for the i_frame_instance entity.
type IFrameInstance struct {
}

// IFrameInstanceLoadMatch is the typed request payload for IFrameInstance.LoadTyped.
type IFrameInstanceLoadMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
	PaymentIframeId string `json:"payment_iframe_id"`
}

// Iframe is the typed data model for the iframe entity.
type Iframe struct {
	AchSetting *map[string]any `json:"ach_setting,omitempty"`
	AllowedParentDomain []any `json:"allowed_parent_domain"`
	AllowedPaymentMethod []any `json:"allowed_payment_method"`
	CardSetting *map[string]any `json:"card_setting,omitempty"`
	ClickToPaySetting *map[string]any `json:"click_to_pay_setting,omitempty"`
	Currency *string `json:"currency,omitempty"`
	Id *string `json:"id,omitempty"`
	Label string `json:"label"`
	Language *string `json:"language,omitempty"`
	Timeout *float64 `json:"timeout,omitempty"`
}

// IframeLoadMatch is the typed request payload for Iframe.LoadTyped.
type IframeLoadMatch struct {
	AccountId string `json:"account_id"`
	IframeId string `json:"iframe_id"`
}

// IframeListMatch is the typed request payload for Iframe.ListTyped.
type IframeListMatch struct {
	AccountId string `json:"account_id"`
}

// IframeCreateData is the typed request payload for Iframe.CreateTyped.
type IframeCreateData struct {
	AccountId string `json:"account_id"`
}

// IframeUpdateData is the typed request payload for Iframe.UpdateTyped.
type IframeUpdateData struct {
	AccountId string `json:"account_id"`
	IframeId string `json:"iframe_id"`
}

// Init is the typed data model for the init entity.
type Init struct {
	Customer *map[string]any `json:"customer,omitempty"`
	Description *string `json:"description,omitempty"`
	Item *[]any `json:"item,omitempty"`
	Level2 *map[string]any `json:"level2,omitempty"`
	Level3 *map[string]any `json:"level3,omitempty"`
	ShippingAddress map[string]any `json:"shipping_address"`
	Trace *map[string]any `json:"trace,omitempty"`
}

// InitCreateData is the typed request payload for Init.CreateTyped.
type InitCreateData struct {
	AccountId string `json:"account_id"`
}

// ListApiKeyScopesEntry is the typed data model for the list_api_key_scopes_entry entity.
type ListApiKeyScopesEntry struct {
	Category *string `json:"category,omitempty"`
	Description *string `json:"description,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Level *int `json:"level,omitempty"`
	Scope *string `json:"scope,omitempty"`
}

// ListApiKeyScopesEntryListMatch is the typed request payload for ListApiKeyScopesEntry.ListTyped.
type ListApiKeyScopesEntryListMatch struct {
	Category *string `json:"category,omitempty"`
	Description *string `json:"description,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Level *int `json:"level,omitempty"`
	Scope *string `json:"scope,omitempty"`
}

// PaymentIframe is the typed data model for the payment_iframe entity.
type PaymentIframe struct {
}

// PaymentIframeRemoveMatch is the typed request payload for PaymentIframe.RemoveTyped.
type PaymentIframeRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// ThreeDSecureAuth is the typed data model for the three_d_secure_auth entity.
type ThreeDSecureAuth struct {
	Browser map[string]any `json:"browser"`
	Card map[string]any `json:"card"`
	Challenge *map[string]any `json:"challenge,omitempty"`
	Customer *map[string]any `json:"customer,omitempty"`
	Purchase map[string]any `json:"purchase"`
	ServerTransactionId *string `json:"server_transaction_id,omitempty"`
	Shipping map[string]any `json:"shipping"`
	Status *string `json:"status,omitempty"`
	ThreeDSecureChallengeIndicator *string `json:"three_d_secure_challenge_indicator,omitempty"`
	ThreeDSecureId *string `json:"three_d_secure_id,omitempty"`
	Trace *map[string]any `json:"trace,omitempty"`
}

// ThreeDSecureAuthCreateData is the typed request payload for ThreeDSecureAuth.CreateTyped.
type ThreeDSecureAuthCreateData struct {
	F3DId string `json:"3_d_id"`
	AccountId string `json:"account_id"`
}

// ThreeDSecureBrowserInit is the typed data model for the three_d_secure_browser_init entity.
type ThreeDSecureBrowserInit struct {
	AcsResultUrl *string `json:"acs_result_url,omitempty"`
	AcsUrl *string `json:"acs_url,omitempty"`
	Cvv *string `json:"cvv,omitempty"`
	Expiry string `json:"expiry"`
	Pan string `json:"pan"`
	PaymentDetailsReference *string `json:"payment_details_reference,omitempty"`
	ServerTransactionId *string `json:"server_transaction_id,omitempty"`
	Status *string `json:"status,omitempty"`
	ThreeDSecureData *string `json:"three_d_secure_data,omitempty"`
	ThreeDSecureId *string `json:"three_d_secure_id,omitempty"`
}

// ThreeDSecureBrowserInitCreateData is the typed request payload for ThreeDSecureBrowserInit.CreateTyped.
type ThreeDSecureBrowserInitCreateData struct {
	AccountId string `json:"account_id"`
}

// ThreeDSecureStatus is the typed data model for the three_d_secure_status entity.
type ThreeDSecureStatus struct {
	Error *map[string]any `json:"error,omitempty"`
	Info *map[string]any `json:"info,omitempty"`
	ServerTransactionId *string `json:"server_transaction_id,omitempty"`
	Status *string `json:"status,omitempty"`
	ThreeDSecure *map[string]any `json:"three_d_secure,omitempty"`
	ThreeDSecureId *string `json:"three_d_secure_id,omitempty"`
}

// ThreeDSecureStatusLoadMatch is the typed request payload for ThreeDSecureStatus.LoadTyped.
type ThreeDSecureStatusLoadMatch struct {
	F3DId string `json:"3_d_id"`
	AccountId string `json:"account_id"`
}

// TransactionDetail is the typed data model for the transaction_detail entity.
type TransactionDetail struct {
	Amount map[string]any `json:"amount"`
	Auth map[string]any `json:"auth"`
	Card *map[string]any `json:"card,omitempty"`
	Customer *map[string]any `json:"customer,omitempty"`
	Description *string `json:"description,omitempty"`
	Id *string `json:"id,omitempty"`
	Item *[]any `json:"item,omitempty"`
	Level2 *map[string]any `json:"level2,omitempty"`
	Level3 *map[string]any `json:"level3,omitempty"`
	Override *map[string]any `json:"override,omitempty"`
	ShippingAddress map[string]any `json:"shipping_address"`
	Status string `json:"status"`
	Timestamp *string `json:"timestamp,omitempty"`
	Trace *map[string]any `json:"trace,omitempty"`
}

// TransactionDetailLoadMatch is the typed request payload for TransactionDetail.LoadTyped.
type TransactionDetailLoadMatch struct {
	AccountId string `json:"account_id"`
	TransactionId string `json:"transaction_id"`
}

// TransactionDetailUpdateData is the typed request payload for TransactionDetail.UpdateTyped.
type TransactionDetailUpdateData struct {
	AccountId string `json:"account_id"`
	TransactionId string `json:"transaction_id"`
}

// Webhook is the typed data model for the webhook entity.
type Webhook struct {
	Event string `json:"event"`
	Id *string `json:"id,omitempty"`
	Url string `json:"url"`
}

// WebhookLoadMatch is the typed request payload for Webhook.LoadTyped.
type WebhookLoadMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// WebhookListMatch is the typed request payload for Webhook.ListTyped.
type WebhookListMatch struct {
	AccountId string `json:"account_id"`
}

// WebhookCreateData is the typed request payload for Webhook.CreateTyped.
type WebhookCreateData struct {
	AccountId string `json:"account_id"`
}

// WebhookUpdateData is the typed request payload for Webhook.UpdateTyped.
type WebhookUpdateData struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// WebhookRemoveMatch is the typed request payload for Webhook.RemoveTyped.
type WebhookRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
