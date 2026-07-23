# Typed models for the BluefinPayconex SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class AccountUpdater(TypedDict):
    pass


class AccountUpdaterRemoveMatchRequired(TypedDict):
    account_id: str
    subscription_id: str


class AccountUpdaterRemoveMatch(AccountUpdaterRemoveMatchRequired, total=False):
    record_id: str


class AccountUpdaterScheduleRequired(TypedDict):
    period_id: str
    token: list


class AccountUpdaterSchedule(AccountUpdaterScheduleRequired, total=False):
    enabled: bool
    period_date: str
    response_format: str


class AccountUpdaterScheduleCreateData(TypedDict):
    account_id: str


class AccountUpdaterScheduleWithResultRequired(TypedDict):
    card: list
    created_at: str
    id: str
    period_id: str
    token: list
    type: str
    updated_at: str


class AccountUpdaterScheduleWithResult(AccountUpdaterScheduleWithResultRequired, total=False):
    enabled: bool
    expiry: str
    most_recent_update: dict
    period_date: str
    response_format: str


class AccountUpdaterScheduleWithResultListMatch(TypedDict):
    account_id: str
    schedule_id: str


class AccountUpdaterScheduleWithResultCreateData(TypedDict):
    account_id: str


class AccountUpdaterSubscriptionWithResult(TypedDict, total=False):
    created_at: str
    enabled: bool
    id: str
    period_date: str
    period_id: str
    record: list
    response_format: str
    template_ref: str
    updated_at: str


class AccountUpdaterSubscriptionWithResultLoadMatch(TypedDict):
    account_id: str
    subscription_id: str


class AccountUpdaterSubscriptionWithResultCreateData(TypedDict):
    account_id: str
    subscription_id: str


class AccountUpdaterSubscriptionWithResultUpdateData(TypedDict):
    account_id: str
    subscription_id: str


class AccountUpdaterUpdate(TypedDict, total=False):
    account_updater_schedule_record_id: str
    format: str
    id: str
    new_expiry: str
    new_token: str
    old_expiry: str
    old_token: str
    recurring_schedule: list
    status: str
    update_id: str
    updated_at: str


class AccountUpdaterUpdateLoadMatch(TypedDict):
    account_id: str
    id: str


class ApiKey(TypedDict, total=False):
    account: list
    enabled: bool
    expires_at: str
    expires_in: str
    id: str
    label: str
    method: list
    scope: list
    secret: str


class ApiKeyLoadMatch(TypedDict):
    account_id: str
    id: str


class ApiKeyListMatch(TypedDict):
    account_id: str


class ApiKeyCreateData(TypedDict):
    account_id: str


class ApiKeyUpdateData(TypedDict):
    account_id: str
    id: str


class ApiKeyRemoveMatch(TypedDict):
    account_id: str
    id: str


class ApplePayMerchantDetailRequired(TypedDict):
    domain: list
    merchant_url: str
    payconex_account_id: str


class ApplePayMerchantDetail(ApplePayMerchantDetailRequired, total=False):
    partner_merchant_name: str


class ApplePayMerchantDetailListMatch(TypedDict):
    account_id: int


class ApplePayMerchantDetailCreateData(TypedDict):
    account_id: int


class ApplePaySessionRequired(TypedDict):
    referrer: str


class ApplePaySession(ApplePaySessionRequired, total=False):
    display_name: str
    domain_name: str
    epoch_timestamp: int
    expires_at: int
    merchant_identifier: str
    merchant_session_identifier: str
    nonce: int
    operational_analytics_identifier: str
    retry: int
    signature: str


class ApplePaySessionCreateData(TypedDict):
    account_id: int


class DynamicDescriptor(TypedDict, total=False):
    city: str
    descriptor: str
    id: str
    name: str
    state: str


class DynamicDescriptorLoadMatch(TypedDict):
    account_id: str
    id: str


class DynamicDescriptorListMatch(TypedDict):
    account_id: str


class DynamicDescriptorCreateData(TypedDict):
    account_id: str


class DynamicDescriptorUpdateData(TypedDict):
    account_id: str
    id: str


class DynamicDescriptorRemoveMatch(TypedDict):
    account_id: str
    id: str


class IFrameCreateInstanceRequired(TypedDict):
    label: str


class IFrameCreateInstance(IFrameCreateInstanceRequired, total=False):
    amount: str
    currency: str
    customer: dict
    initialize_transaction: bool
    language: str
    reference: str
    timeout: float
    token: list


class IFrameCreateInstanceCreateData(TypedDict):
    account_id: str
    payment_iframe_id: str


class IFrameInstance(TypedDict):
    pass


class IFrameInstanceLoadMatch(TypedDict):
    account_id: str
    id: str
    payment_iframe_id: str


class IframeRequired(TypedDict):
    allowed_parent_domain: list
    allowed_payment_method: list
    label: str


class Iframe(IframeRequired, total=False):
    ach_setting: dict
    card_setting: dict
    click_to_pay_setting: dict
    currency: str
    id: str
    language: str
    timeout: float


class IframeLoadMatch(TypedDict):
    account_id: str
    iframe_id: str


class IframeListMatch(TypedDict):
    account_id: str


class IframeCreateData(TypedDict):
    account_id: str


class IframeUpdateData(TypedDict):
    account_id: str
    iframe_id: str


class InitRequired(TypedDict):
    shipping_address: dict


class Init(InitRequired, total=False):
    customer: dict
    description: str
    item: list
    level2: dict
    level3: dict
    trace: dict


class InitCreateData(TypedDict):
    account_id: str


class ListApiKeyScopesEntry(TypedDict, total=False):
    category: str
    description: str
    enabled: bool
    level: int
    scope: str


class ListApiKeyScopesEntryListMatch(TypedDict, total=False):
    category: str
    description: str
    enabled: bool
    level: int
    scope: str


class PaymentIframe(TypedDict):
    pass


class PaymentIframeRemoveMatch(TypedDict):
    account_id: str
    id: str


class ThreeDSecureAuthRequired(TypedDict):
    browser: dict
    card: dict
    purchase: dict
    shipping: dict


class ThreeDSecureAuth(ThreeDSecureAuthRequired, total=False):
    challenge: dict
    customer: dict
    server_transaction_id: str
    status: str
    three_d_secure_challenge_indicator: str
    three_d_secure_id: str
    trace: dict


class ThreeDSecureAuthCreateData(TypedDict):
    account_id: str


class ThreeDSecureBrowserInitRequired(TypedDict):
    expiry: str
    pan: str


class ThreeDSecureBrowserInit(ThreeDSecureBrowserInitRequired, total=False):
    acs_result_url: str
    acs_url: str
    cvv: str
    payment_details_reference: str
    server_transaction_id: str
    status: str
    three_d_secure_data: str
    three_d_secure_id: str


class ThreeDSecureBrowserInitCreateData(TypedDict):
    account_id: str


class ThreeDSecureStatus(TypedDict, total=False):
    error: dict
    info: dict
    server_transaction_id: str
    status: str
    three_d_secure: dict
    three_d_secure_id: str


class ThreeDSecureStatusLoadMatch(TypedDict):
    account_id: str


class TransactionDetailRequired(TypedDict):
    amount: dict
    auth: dict
    shipping_address: dict
    status: str


class TransactionDetail(TransactionDetailRequired, total=False):
    card: dict
    customer: dict
    description: str
    id: str
    item: list
    level2: dict
    level3: dict
    override: dict
    timestamp: str
    trace: dict


class TransactionDetailLoadMatch(TypedDict):
    account_id: str
    transaction_id: str


class TransactionDetailUpdateData(TypedDict):
    account_id: str
    transaction_id: str


class WebhookRequired(TypedDict):
    event: str
    url: str


class Webhook(WebhookRequired, total=False):
    id: str


class WebhookLoadMatch(TypedDict):
    account_id: str
    id: str


class WebhookListMatch(TypedDict):
    account_id: str


class WebhookCreateData(TypedDict):
    account_id: str


class WebhookUpdateData(TypedDict):
    account_id: str
    id: str


class WebhookRemoveMatch(TypedDict):
    account_id: str
    id: str
