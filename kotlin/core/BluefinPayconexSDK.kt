package voxgig.bluefinpayconexsdk.core

/**
 * BluefinPayconex SDK client. All transport and pipeline behaviour lives in the
 * SdkClient base (core/SdkClient.kt); this class binds the API-specific
 * entity accessors and the test-mode constructor.
 */
class BluefinPayconexSDK(options: MutableMap<String, Any?>?) : SdkClient(options) {

  constructor() : this(null)


  /**
   * Returns a account_updater entity bound to this client.
   * Idiomatic usage: client.accountUpdater(null).list(null, null) or
   * client.accountUpdater(null).load(mutableMapOf("id" to ...), null).
   */
  fun accountUpdater(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.AccountUpdaterEntity(this, entopts)
  }

  /**
   * Returns a account_updater_schedule entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSchedule(null).list(null, null) or
   * client.accountUpdaterSchedule(null).load(mutableMapOf("id" to ...), null).
   */
  fun accountUpdaterSchedule(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleEntity(this, entopts)
  }

  /**
   * Returns a account_updater_schedule_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterScheduleWithResult(null).list(null, null) or
   * client.accountUpdaterScheduleWithResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun accountUpdaterScheduleWithResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleWithResultEntity(this, entopts)
  }

  /**
   * Returns a account_updater_subscription_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSubscriptionWithResult(null).list(null, null) or
   * client.accountUpdaterSubscriptionWithResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun accountUpdaterSubscriptionWithResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.AccountUpdaterSubscriptionWithResultEntity(this, entopts)
  }

  /**
   * Returns a account_updater_update entity bound to this client.
   * Idiomatic usage: client.accountUpdaterUpdate(null).list(null, null) or
   * client.accountUpdaterUpdate(null).load(mutableMapOf("id" to ...), null).
   */
  fun accountUpdaterUpdate(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.AccountUpdaterUpdateEntity(this, entopts)
  }

  /**
   * Returns a api_key entity bound to this client.
   * Idiomatic usage: client.apiKey(null).list(null, null) or
   * client.apiKey(null).load(mutableMapOf("id" to ...), null).
   */
  fun apiKey(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ApiKeyEntity(this, entopts)
  }

  /**
   * Returns a apple_pay_merchant_detail entity bound to this client.
   * Idiomatic usage: client.applePayMerchantDetail(null).list(null, null) or
   * client.applePayMerchantDetail(null).load(mutableMapOf("id" to ...), null).
   */
  fun applePayMerchantDetail(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ApplePayMerchantDetailEntity(this, entopts)
  }

  /**
   * Returns a apple_pay_session entity bound to this client.
   * Idiomatic usage: client.applePaySession(null).list(null, null) or
   * client.applePaySession(null).load(mutableMapOf("id" to ...), null).
   */
  fun applePaySession(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ApplePaySessionEntity(this, entopts)
  }

  /**
   * Returns a dynamic_descriptor entity bound to this client.
   * Idiomatic usage: client.dynamicDescriptor(null).list(null, null) or
   * client.dynamicDescriptor(null).load(mutableMapOf("id" to ...), null).
   */
  fun dynamicDescriptor(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.DynamicDescriptorEntity(this, entopts)
  }

  /**
   * Returns a i_frame_create_instance entity bound to this client.
   * Idiomatic usage: client.iFrameCreateInstance(null).list(null, null) or
   * client.iFrameCreateInstance(null).load(mutableMapOf("id" to ...), null).
   */
  fun iFrameCreateInstance(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.IFrameCreateInstanceEntity(this, entopts)
  }

  /**
   * Returns a i_frame_instance entity bound to this client.
   * Idiomatic usage: client.iFrameInstance(null).list(null, null) or
   * client.iFrameInstance(null).load(mutableMapOf("id" to ...), null).
   */
  fun iFrameInstance(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.IFrameInstanceEntity(this, entopts)
  }

  /**
   * Returns a iframe entity bound to this client.
   * Idiomatic usage: client.iframe(null).list(null, null) or
   * client.iframe(null).load(mutableMapOf("id" to ...), null).
   */
  fun iframe(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.IframeEntity(this, entopts)
  }

  /**
   * Returns a init entity bound to this client.
   * Idiomatic usage: client.init(null).list(null, null) or
   * client.init(null).load(mutableMapOf("id" to ...), null).
   */
  fun init(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.InitEntity(this, entopts)
  }

  /**
   * Returns a list_api_key_scopes_entry entity bound to this client.
   * Idiomatic usage: client.listApiKeyScopesEntry(null).list(null, null) or
   * client.listApiKeyScopesEntry(null).load(mutableMapOf("id" to ...), null).
   */
  fun listApiKeyScopesEntry(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ListApiKeyScopesEntryEntity(this, entopts)
  }

  /**
   * Returns a payment_iframe entity bound to this client.
   * Idiomatic usage: client.paymentIframe(null).list(null, null) or
   * client.paymentIframe(null).load(mutableMapOf("id" to ...), null).
   */
  fun paymentIframe(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.PaymentIframeEntity(this, entopts)
  }

  /**
   * Returns a three_d_secure_auth entity bound to this client.
   * Idiomatic usage: client.threeDSecureAuth(null).list(null, null) or
   * client.threeDSecureAuth(null).load(mutableMapOf("id" to ...), null).
   */
  fun threeDSecureAuth(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ThreeDSecureAuthEntity(this, entopts)
  }

  /**
   * Returns a three_d_secure_browser_init entity bound to this client.
   * Idiomatic usage: client.threeDSecureBrowserInit(null).list(null, null) or
   * client.threeDSecureBrowserInit(null).load(mutableMapOf("id" to ...), null).
   */
  fun threeDSecureBrowserInit(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ThreeDSecureBrowserInitEntity(this, entopts)
  }

  /**
   * Returns a three_d_secure_status entity bound to this client.
   * Idiomatic usage: client.threeDSecureStatus(null).list(null, null) or
   * client.threeDSecureStatus(null).load(mutableMapOf("id" to ...), null).
   */
  fun threeDSecureStatus(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.ThreeDSecureStatusEntity(this, entopts)
  }

  /**
   * Returns a transaction_detail entity bound to this client.
   * Idiomatic usage: client.transactionDetail(null).list(null, null) or
   * client.transactionDetail(null).load(mutableMapOf("id" to ...), null).
   */
  fun transactionDetail(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.TransactionDetailEntity(this, entopts)
  }

  /**
   * Returns a webhook entity bound to this client.
   * Idiomatic usage: client.webhook(null).list(null, null) or
   * client.webhook(null).load(mutableMapOf("id" to ...), null).
   */
  fun webhook(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinpayconexsdk.entity.WebhookEntity(this, entopts)
  }


  companion object {
    // testSDK builds a client in test mode: the test feature is activated,
    // installing the in-memory mock transport (no network activity).
    fun testSDK(): BluefinPayconexSDK = testSDK(null, null)

    fun testSDK(
      testopts: MutableMap<String, Any?>?,
      sdkopts: MutableMap<String, Any?>?,
    ): BluefinPayconexSDK {
      val sdk = BluefinPayconexSDK(testOptions(testopts, sdkopts))
      sdk.mode = "test"
      return sdk
    }
  }
}
