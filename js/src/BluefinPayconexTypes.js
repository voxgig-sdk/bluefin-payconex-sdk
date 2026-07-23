// Typed models for the BluefinPayconex SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} AccountUpdater
 */

/**
 * @typedef {Object} AccountUpdaterRemoveMatch
 * @property {string} account_id
 * @property {string} [record_id]
 * @property {string} subscription_id
 */

/**
 * @typedef {Object} AccountUpdaterSchedule
 * @property {boolean} [enabled]
 * @property {string} [period_date]
 * @property {string} period_id
 * @property {string} [response_format]
 * @property {Array} token
 */

/**
 * @typedef {Object} AccountUpdaterScheduleCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} AccountUpdaterScheduleWithResult
 * @property {Array} card
 * @property {string} created_at
 * @property {boolean} [enabled]
 * @property {string} [expiry]
 * @property {string} id
 * @property {Object} [most_recent_update]
 * @property {string} [period_date]
 * @property {string} period_id
 * @property {string} [response_format]
 * @property {Array} token
 * @property {string} type
 * @property {string} updated_at
 */

/**
 * @typedef {Object} AccountUpdaterScheduleWithResultListMatch
 * @property {string} account_id
 * @property {string} schedule_id
 */

/**
 * @typedef {Object} AccountUpdaterScheduleWithResultCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} AccountUpdaterSubscriptionWithResult
 * @property {string} [created_at]
 * @property {boolean} [enabled]
 * @property {string} [id]
 * @property {string} [period_date]
 * @property {string} [period_id]
 * @property {Array} [record]
 * @property {string} [response_format]
 * @property {string} [template_ref]
 * @property {string} [updated_at]
 */

/**
 * @typedef {Object} AccountUpdaterSubscriptionWithResultLoadMatch
 * @property {string} account_id
 * @property {string} subscription_id
 */

/**
 * @typedef {Object} AccountUpdaterSubscriptionWithResultCreateData
 * @property {string} account_id
 * @property {string} subscription_id
 */

/**
 * @typedef {Object} AccountUpdaterSubscriptionWithResultUpdateData
 * @property {string} account_id
 * @property {string} subscription_id
 */

/**
 * @typedef {Object} AccountUpdaterUpdate
 * @property {string} [account_updater_schedule_record_id]
 * @property {string} [format]
 * @property {string} [id]
 * @property {string} [new_expiry]
 * @property {string} [new_token]
 * @property {string} [old_expiry]
 * @property {string} [old_token]
 * @property {Array} [recurring_schedule]
 * @property {string} [status]
 * @property {string} [update_id]
 * @property {string} [updated_at]
 */

/**
 * @typedef {Object} AccountUpdaterUpdateLoadMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} ApiKey
 * @property {Array} [account]
 * @property {boolean} [enabled]
 * @property {string} [expires_at]
 * @property {string} [expires_in]
 * @property {string} [id]
 * @property {string} [label]
 * @property {Array} [method]
 * @property {Array} [scope]
 * @property {string} [secret]
 */

/**
 * @typedef {Object} ApiKeyLoadMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} ApiKeyListMatch
 * @property {string} account_id
 */

/**
 * @typedef {Object} ApiKeyCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} ApiKeyUpdateData
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} ApiKeyRemoveMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} ApplePayMerchantDetail
 * @property {Array} domain
 * @property {string} merchant_url
 * @property {string} [partner_merchant_name]
 * @property {string} payconex_account_id
 */

/**
 * @typedef {Object} ApplePayMerchantDetailListMatch
 * @property {number} account_id
 */

/**
 * @typedef {Object} ApplePayMerchantDetailCreateData
 * @property {number} account_id
 */

/**
 * @typedef {Object} ApplePaySession
 * @property {string} [display_name]
 * @property {string} [domain_name]
 * @property {number} [epoch_timestamp]
 * @property {number} [expires_at]
 * @property {string} [merchant_identifier]
 * @property {string} [merchant_session_identifier]
 * @property {number} [nonce]
 * @property {string} [operational_analytics_identifier]
 * @property {string} referrer
 * @property {number} [retry]
 * @property {string} [signature]
 */

/**
 * @typedef {Object} ApplePaySessionCreateData
 * @property {number} account_id
 */

/**
 * @typedef {Object} DynamicDescriptor
 * @property {string} [city]
 * @property {string} [descriptor]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [state]
 */

/**
 * @typedef {Object} DynamicDescriptorLoadMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} DynamicDescriptorListMatch
 * @property {string} account_id
 */

/**
 * @typedef {Object} DynamicDescriptorCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} DynamicDescriptorUpdateData
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} DynamicDescriptorRemoveMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} IFrameCreateInstance
 * @property {string} [amount]
 * @property {string} [currency]
 * @property {Object} [customer]
 * @property {boolean} [initialize_transaction]
 * @property {string} label
 * @property {string} [language]
 * @property {string} [reference]
 * @property {number} [timeout]
 * @property {Array} [token]
 */

/**
 * @typedef {Object} IFrameCreateInstanceCreateData
 * @property {string} account_id
 * @property {string} payment_iframe_id
 */

/**
 * @typedef {Object} IFrameInstance
 */

/**
 * @typedef {Object} IFrameInstanceLoadMatch
 * @property {string} account_id
 * @property {string} id
 * @property {string} payment_iframe_id
 */

/**
 * @typedef {Object} Iframe
 * @property {Object} [ach_setting]
 * @property {Array} allowed_parent_domain
 * @property {Array} allowed_payment_method
 * @property {Object} [card_setting]
 * @property {Object} [click_to_pay_setting]
 * @property {string} [currency]
 * @property {string} [id]
 * @property {string} label
 * @property {string} [language]
 * @property {number} [timeout]
 */

/**
 * @typedef {Object} IframeLoadMatch
 * @property {string} account_id
 * @property {string} iframe_id
 */

/**
 * @typedef {Object} IframeListMatch
 * @property {string} account_id
 */

/**
 * @typedef {Object} IframeCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} IframeUpdateData
 * @property {string} account_id
 * @property {string} iframe_id
 */

/**
 * @typedef {Object} Init
 * @property {Object} [customer]
 * @property {string} [description]
 * @property {Array} [item]
 * @property {Object} [level2]
 * @property {Object} [level3]
 * @property {Object} shipping_address
 * @property {Object} [trace]
 */

/**
 * @typedef {Object} InitCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} ListApiKeyScopesEntry
 * @property {string} [category]
 * @property {string} [description]
 * @property {boolean} [enabled]
 * @property {number} [level]
 * @property {string} [scope]
 */

/**
 * @typedef {Object} ListApiKeyScopesEntryListMatch
 * @property {string} [category]
 * @property {string} [description]
 * @property {boolean} [enabled]
 * @property {number} [level]
 * @property {string} [scope]
 */

/**
 * @typedef {Object} PaymentIframe
 */

/**
 * @typedef {Object} PaymentIframeRemoveMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} ThreeDSecureAuth
 * @property {Object} browser
 * @property {Object} card
 * @property {Object} [challenge]
 * @property {Object} [customer]
 * @property {Object} purchase
 * @property {string} [server_transaction_id]
 * @property {Object} shipping
 * @property {string} [status]
 * @property {string} [three_d_secure_challenge_indicator]
 * @property {string} [three_d_secure_id]
 * @property {Object} [trace]
 */

/**
 * @typedef {Object} ThreeDSecureAuthCreateData
 * @property {string} "3_d_id"
 * @property {string} account_id
 */

/**
 * @typedef {Object} ThreeDSecureBrowserInit
 * @property {string} [acs_result_url]
 * @property {string} [acs_url]
 * @property {string} [cvv]
 * @property {string} expiry
 * @property {string} pan
 * @property {string} [payment_details_reference]
 * @property {string} [server_transaction_id]
 * @property {string} [status]
 * @property {string} [three_d_secure_data]
 * @property {string} [three_d_secure_id]
 */

/**
 * @typedef {Object} ThreeDSecureBrowserInitCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} ThreeDSecureStatus
 * @property {Object} [error]
 * @property {Object} [info]
 * @property {string} [server_transaction_id]
 * @property {string} [status]
 * @property {Object} [three_d_secure]
 * @property {string} [three_d_secure_id]
 */

/**
 * @typedef {Object} ThreeDSecureStatusLoadMatch
 * @property {string} "3_d_id"
 * @property {string} account_id
 */

/**
 * @typedef {Object} TransactionDetail
 * @property {Object} amount
 * @property {Object} auth
 * @property {Object} [card]
 * @property {Object} [customer]
 * @property {string} [description]
 * @property {string} [id]
 * @property {Array} [item]
 * @property {Object} [level2]
 * @property {Object} [level3]
 * @property {Object} [override]
 * @property {Object} shipping_address
 * @property {string} status
 * @property {string} [timestamp]
 * @property {Object} [trace]
 */

/**
 * @typedef {Object} TransactionDetailLoadMatch
 * @property {string} account_id
 * @property {string} transaction_id
 */

/**
 * @typedef {Object} TransactionDetailUpdateData
 * @property {string} account_id
 * @property {string} transaction_id
 */

/**
 * @typedef {Object} Webhook
 * @property {string} event
 * @property {string} [id]
 * @property {string} url
 */

/**
 * @typedef {Object} WebhookLoadMatch
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} WebhookListMatch
 * @property {string} account_id
 */

/**
 * @typedef {Object} WebhookCreateData
 * @property {string} account_id
 */

/**
 * @typedef {Object} WebhookUpdateData
 * @property {string} account_id
 * @property {string} id
 */

/**
 * @typedef {Object} WebhookRemoveMatch
 * @property {string} account_id
 * @property {string} id
 */

