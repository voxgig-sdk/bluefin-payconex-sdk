<?php
declare(strict_types=1);

// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** AccountUpdater entity data model. */
class AccountUpdater
{
}

/** Request payload for AccountUpdater#remove. */
class AccountUpdaterRemoveMatch
{
    public string $account_id;
    public ?string $record_id = null;
    public string $subscription_id;
}

/** AccountUpdaterSchedule entity data model. */
class AccountUpdaterSchedule
{
    public ?bool $enabled = null;
    public ?string $period_date = null;
    public string $period_id;
    public ?string $response_format = null;
    public array $token;
}

/** Request payload for AccountUpdaterSchedule#create. */
class AccountUpdaterScheduleCreateData
{
    public string $account_id;
}

/** AccountUpdaterScheduleWithResult entity data model. */
class AccountUpdaterScheduleWithResult
{
    public array $card;
    public string $created_at;
    public ?bool $enabled = null;
    public ?string $expiry = null;
    public string $id;
    public ?array $most_recent_update = null;
    public ?string $period_date = null;
    public string $period_id;
    public ?string $response_format = null;
    public array $token;
    public string $type;
    public string $updated_at;
}

/** Request payload for AccountUpdaterScheduleWithResult#list. */
class AccountUpdaterScheduleWithResultListMatch
{
    public string $account_id;
    public string $schedule_id;
}

/** Request payload for AccountUpdaterScheduleWithResult#create. */
class AccountUpdaterScheduleWithResultCreateData
{
    public string $account_id;
}

/** AccountUpdaterSubscriptionWithResult entity data model. */
class AccountUpdaterSubscriptionWithResult
{
    public ?string $created_at = null;
    public ?bool $enabled = null;
    public ?string $id = null;
    public ?string $period_date = null;
    public ?string $period_id = null;
    public ?array $record = null;
    public ?string $response_format = null;
    public ?string $template_ref = null;
    public ?string $updated_at = null;
}

/** Request payload for AccountUpdaterSubscriptionWithResult#load. */
class AccountUpdaterSubscriptionWithResultLoadMatch
{
    public string $account_id;
    public string $subscription_id;
}

/** Request payload for AccountUpdaterSubscriptionWithResult#create. */
class AccountUpdaterSubscriptionWithResultCreateData
{
    public string $account_id;
    public string $subscription_id;
}

/** Request payload for AccountUpdaterSubscriptionWithResult#update. */
class AccountUpdaterSubscriptionWithResultUpdateData
{
    public string $account_id;
    public string $subscription_id;
}

/** AccountUpdaterUpdate entity data model. */
class AccountUpdaterUpdate
{
    public ?string $account_updater_schedule_record_id = null;
    public ?string $format = null;
    public ?string $id = null;
    public ?string $new_expiry = null;
    public ?string $new_token = null;
    public ?string $old_expiry = null;
    public ?string $old_token = null;
    public ?array $recurring_schedule = null;
    public ?string $status = null;
    public ?string $update_id = null;
    public ?string $updated_at = null;
}

/** Request payload for AccountUpdaterUpdate#load. */
class AccountUpdaterUpdateLoadMatch
{
    public string $account_id;
    public string $id;
}

/** ApiKey entity data model. */
class ApiKey
{
    public ?array $account = null;
    public ?bool $enabled = null;
    public ?string $expires_at = null;
    public ?string $expires_in = null;
    public ?string $id = null;
    public ?string $label = null;
    public ?array $method = null;
    public ?array $scope = null;
    public ?string $secret = null;
}

/** Request payload for ApiKey#load. */
class ApiKeyLoadMatch
{
    public string $account_id;
    public string $id;
}

/** Request payload for ApiKey#list. */
class ApiKeyListMatch
{
    public string $account_id;
}

/** Request payload for ApiKey#create. */
class ApiKeyCreateData
{
    public string $account_id;
}

/** Request payload for ApiKey#update. */
class ApiKeyUpdateData
{
    public string $account_id;
    public string $id;
}

/** Request payload for ApiKey#remove. */
class ApiKeyRemoveMatch
{
    public string $account_id;
    public string $id;
}

/** ApplePayMerchantDetail entity data model. */
class ApplePayMerchantDetail
{
    public array $domain;
    public string $merchant_url;
    public ?string $partner_merchant_name = null;
    public string $payconex_account_id;
}

/** Request payload for ApplePayMerchantDetail#list. */
class ApplePayMerchantDetailListMatch
{
    public int $account_id;
}

/** Request payload for ApplePayMerchantDetail#create. */
class ApplePayMerchantDetailCreateData
{
    public int $account_id;
}

/** ApplePaySession entity data model. */
class ApplePaySession
{
    public ?string $display_name = null;
    public ?string $domain_name = null;
    public ?int $epoch_timestamp = null;
    public ?int $expires_at = null;
    public ?string $merchant_identifier = null;
    public ?string $merchant_session_identifier = null;
    public ?int $nonce = null;
    public ?string $operational_analytics_identifier = null;
    public string $referrer;
    public ?int $retry = null;
    public ?string $signature = null;
}

/** Request payload for ApplePaySession#create. */
class ApplePaySessionCreateData
{
    public int $account_id;
}

/** DynamicDescriptor entity data model. */
class DynamicDescriptor
{
    public ?string $city = null;
    public ?string $descriptor = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $state = null;
}

/** Request payload for DynamicDescriptor#load. */
class DynamicDescriptorLoadMatch
{
    public string $account_id;
    public string $id;
}

/** Request payload for DynamicDescriptor#list. */
class DynamicDescriptorListMatch
{
    public string $account_id;
}

/** Request payload for DynamicDescriptor#create. */
class DynamicDescriptorCreateData
{
    public string $account_id;
}

/** Request payload for DynamicDescriptor#update. */
class DynamicDescriptorUpdateData
{
    public string $account_id;
    public string $id;
}

/** Request payload for DynamicDescriptor#remove. */
class DynamicDescriptorRemoveMatch
{
    public string $account_id;
    public string $id;
}

/** IFrameCreateInstance entity data model. */
class IFrameCreateInstance
{
    public ?string $amount = null;
    public ?string $currency = null;
    public ?array $customer = null;
    public ?bool $initialize_transaction = null;
    public string $label;
    public ?string $language = null;
    public ?string $reference = null;
    public ?float $timeout = null;
    public ?array $token = null;
}

/** Request payload for IFrameCreateInstance#create. */
class IFrameCreateInstanceCreateData
{
    public string $account_id;
    public string $payment_iframe_id;
}

/** IFrameInstance entity data model. */
class IFrameInstance
{
}

/** Request payload for IFrameInstance#load. */
class IFrameInstanceLoadMatch
{
    public string $account_id;
    public string $id;
    public string $payment_iframe_id;
}

/** Iframe entity data model. */
class Iframe
{
    public ?array $ach_setting = null;
    public array $allowed_parent_domain;
    public array $allowed_payment_method;
    public ?array $card_setting = null;
    public ?array $click_to_pay_setting = null;
    public ?string $currency = null;
    public ?string $id = null;
    public string $label;
    public ?string $language = null;
    public ?float $timeout = null;
}

/** Request payload for Iframe#load. */
class IframeLoadMatch
{
    public string $account_id;
    public string $iframe_id;
}

/** Request payload for Iframe#list. */
class IframeListMatch
{
    public string $account_id;
}

/** Request payload for Iframe#create. */
class IframeCreateData
{
    public string $account_id;
}

/** Request payload for Iframe#update. */
class IframeUpdateData
{
    public string $account_id;
    public string $iframe_id;
}

/** Init entity data model. */
class Init
{
    public ?array $customer = null;
    public ?string $description = null;
    public ?array $item = null;
    public ?array $level2 = null;
    public ?array $level3 = null;
    public array $shipping_address;
    public ?array $trace = null;
}

/** Request payload for Init#create. */
class InitCreateData
{
    public string $account_id;
}

/** ListApiKeyScopesEntry entity data model. */
class ListApiKeyScopesEntry
{
    public ?string $category = null;
    public ?string $description = null;
    public ?bool $enabled = null;
    public ?int $level = null;
    public ?string $scope = null;
}

/** Request payload for ListApiKeyScopesEntry#list. */
class ListApiKeyScopesEntryListMatch
{
    public ?string $category = null;
    public ?string $description = null;
    public ?bool $enabled = null;
    public ?int $level = null;
    public ?string $scope = null;
}

/** PaymentIframe entity data model. */
class PaymentIframe
{
}

/** Request payload for PaymentIframe#remove. */
class PaymentIframeRemoveMatch
{
    public string $account_id;
    public string $id;
}

/** ThreeDSecureAuth entity data model. */
class ThreeDSecureAuth
{
    public array $browser;
    public array $card;
    public ?array $challenge = null;
    public ?array $customer = null;
    public array $purchase;
    public ?string $server_transaction_id = null;
    public array $shipping;
    public ?string $status = null;
    public ?string $three_d_secure_challenge_indicator = null;
    public ?string $three_d_secure_id = null;
    public ?array $trace = null;
}

/** Request payload for ThreeDSecureAuth#create. */
class ThreeDSecureAuthCreateData
{
    public string $account_id;
}

/** ThreeDSecureBrowserInit entity data model. */
class ThreeDSecureBrowserInit
{
    public ?string $acs_result_url = null;
    public ?string $acs_url = null;
    public ?string $cvv = null;
    public string $expiry;
    public string $pan;
    public ?string $payment_details_reference = null;
    public ?string $server_transaction_id = null;
    public ?string $status = null;
    public ?string $three_d_secure_data = null;
    public ?string $three_d_secure_id = null;
}

/** Request payload for ThreeDSecureBrowserInit#create. */
class ThreeDSecureBrowserInitCreateData
{
    public string $account_id;
}

/** ThreeDSecureStatus entity data model. */
class ThreeDSecureStatus
{
    public ?array $error = null;
    public ?array $info = null;
    public ?string $server_transaction_id = null;
    public ?string $status = null;
    public ?array $three_d_secure = null;
    public ?string $three_d_secure_id = null;
}

/** Request payload for ThreeDSecureStatus#load. */
class ThreeDSecureStatusLoadMatch
{
    public string $account_id;
}

/** TransactionDetail entity data model. */
class TransactionDetail
{
    public array $amount;
    public array $auth;
    public ?array $card = null;
    public ?array $customer = null;
    public ?string $description = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $level2 = null;
    public ?array $level3 = null;
    public ?array $override = null;
    public array $shipping_address;
    public string $status;
    public ?string $timestamp = null;
    public ?array $trace = null;
}

/** Request payload for TransactionDetail#load. */
class TransactionDetailLoadMatch
{
    public string $account_id;
    public string $transaction_id;
}

/** Request payload for TransactionDetail#update. */
class TransactionDetailUpdateData
{
    public string $account_id;
    public string $transaction_id;
}

/** Webhook entity data model. */
class Webhook
{
    public string $event;
    public ?string $id = null;
    public string $url;
}

/** Request payload for Webhook#load. */
class WebhookLoadMatch
{
    public string $account_id;
    public string $id;
}

/** Request payload for Webhook#list. */
class WebhookListMatch
{
    public string $account_id;
}

/** Request payload for Webhook#create. */
class WebhookCreateData
{
    public string $account_id;
}

/** Request payload for Webhook#update. */
class WebhookUpdateData
{
    public string $account_id;
    public string $id;
}

/** Request payload for Webhook#remove. */
class WebhookRemoveMatch
{
    public string $account_id;
    public string $id;
}

