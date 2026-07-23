package voxgig.bluefinpayconexsdk.core

import java.util.{Map => JMap}

// BluefinPayconex SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/SdkClient.scala); this class binds the API-specific
// entity accessors and the test-mode constructor.
class BluefinPayconexSDK(options: JMap[String, Object]) extends SdkClient(options) {

  def this() = this(null)


  /**
   * Returns a account_updater entity bound to this client.
   * Idiomatic usage: client.accountUpdater(null).list(null, null) or
   * client.accountUpdater(null).load(java.util.Map.of("id", ...), null).
   */
  def accountUpdater(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.AccountUpdaterEntity(this, entopts)

  /**
   * Returns a account_updater_schedule entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSchedule(null).list(null, null) or
   * client.accountUpdaterSchedule(null).load(java.util.Map.of("id", ...), null).
   */
  def accountUpdaterSchedule(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleEntity(this, entopts)

  /**
   * Returns a account_updater_schedule_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterScheduleWithResult(null).list(null, null) or
   * client.accountUpdaterScheduleWithResult(null).load(java.util.Map.of("id", ...), null).
   */
  def accountUpdaterScheduleWithResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleWithResultEntity(this, entopts)

  /**
   * Returns a account_updater_subscription_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSubscriptionWithResult(null).list(null, null) or
   * client.accountUpdaterSubscriptionWithResult(null).load(java.util.Map.of("id", ...), null).
   */
  def accountUpdaterSubscriptionWithResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.AccountUpdaterSubscriptionWithResultEntity(this, entopts)

  /**
   * Returns a account_updater_update entity bound to this client.
   * Idiomatic usage: client.accountUpdaterUpdate(null).list(null, null) or
   * client.accountUpdaterUpdate(null).load(java.util.Map.of("id", ...), null).
   */
  def accountUpdaterUpdate(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.AccountUpdaterUpdateEntity(this, entopts)

  /**
   * Returns a api_key entity bound to this client.
   * Idiomatic usage: client.apiKey(null).list(null, null) or
   * client.apiKey(null).load(java.util.Map.of("id", ...), null).
   */
  def apiKey(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ApiKeyEntity(this, entopts)

  /**
   * Returns a apple_pay_merchant_detail entity bound to this client.
   * Idiomatic usage: client.applePayMerchantDetail(null).list(null, null) or
   * client.applePayMerchantDetail(null).load(java.util.Map.of("id", ...), null).
   */
  def applePayMerchantDetail(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ApplePayMerchantDetailEntity(this, entopts)

  /**
   * Returns a apple_pay_session entity bound to this client.
   * Idiomatic usage: client.applePaySession(null).list(null, null) or
   * client.applePaySession(null).load(java.util.Map.of("id", ...), null).
   */
  def applePaySession(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ApplePaySessionEntity(this, entopts)

  /**
   * Returns a dynamic_descriptor entity bound to this client.
   * Idiomatic usage: client.dynamicDescriptor(null).list(null, null) or
   * client.dynamicDescriptor(null).load(java.util.Map.of("id", ...), null).
   */
  def dynamicDescriptor(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.DynamicDescriptorEntity(this, entopts)

  /**
   * Returns a i_frame_create_instance entity bound to this client.
   * Idiomatic usage: client.iFrameCreateInstance(null).list(null, null) or
   * client.iFrameCreateInstance(null).load(java.util.Map.of("id", ...), null).
   */
  def iFrameCreateInstance(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.IFrameCreateInstanceEntity(this, entopts)

  /**
   * Returns a i_frame_instance entity bound to this client.
   * Idiomatic usage: client.iFrameInstance(null).list(null, null) or
   * client.iFrameInstance(null).load(java.util.Map.of("id", ...), null).
   */
  def iFrameInstance(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.IFrameInstanceEntity(this, entopts)

  /**
   * Returns a iframe entity bound to this client.
   * Idiomatic usage: client.iframe(null).list(null, null) or
   * client.iframe(null).load(java.util.Map.of("id", ...), null).
   */
  def iframe(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.IframeEntity(this, entopts)

  /**
   * Returns a init entity bound to this client.
   * Idiomatic usage: client.init(null).list(null, null) or
   * client.init(null).load(java.util.Map.of("id", ...), null).
   */
  def init(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.InitEntity(this, entopts)

  /**
   * Returns a list_api_key_scopes_entry entity bound to this client.
   * Idiomatic usage: client.listApiKeyScopesEntry(null).list(null, null) or
   * client.listApiKeyScopesEntry(null).load(java.util.Map.of("id", ...), null).
   */
  def listApiKeyScopesEntry(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ListApiKeyScopesEntryEntity(this, entopts)

  /**
   * Returns a payment_iframe entity bound to this client.
   * Idiomatic usage: client.paymentIframe(null).list(null, null) or
   * client.paymentIframe(null).load(java.util.Map.of("id", ...), null).
   */
  def paymentIframe(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.PaymentIframeEntity(this, entopts)

  /**
   * Returns a three_d_secure_auth entity bound to this client.
   * Idiomatic usage: client.threeDSecureAuth(null).list(null, null) or
   * client.threeDSecureAuth(null).load(java.util.Map.of("id", ...), null).
   */
  def threeDSecureAuth(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ThreeDSecureAuthEntity(this, entopts)

  /**
   * Returns a three_d_secure_browser_init entity bound to this client.
   * Idiomatic usage: client.threeDSecureBrowserInit(null).list(null, null) or
   * client.threeDSecureBrowserInit(null).load(java.util.Map.of("id", ...), null).
   */
  def threeDSecureBrowserInit(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ThreeDSecureBrowserInitEntity(this, entopts)

  /**
   * Returns a three_d_secure_status entity bound to this client.
   * Idiomatic usage: client.threeDSecureStatus(null).list(null, null) or
   * client.threeDSecureStatus(null).load(java.util.Map.of("id", ...), null).
   */
  def threeDSecureStatus(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.ThreeDSecureStatusEntity(this, entopts)

  /**
   * Returns a transaction_detail entity bound to this client.
   * Idiomatic usage: client.transactionDetail(null).list(null, null) or
   * client.transactionDetail(null).load(java.util.Map.of("id", ...), null).
   */
  def transactionDetail(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.TransactionDetailEntity(this, entopts)

  /**
   * Returns a webhook entity bound to this client.
   * Idiomatic usage: client.webhook(null).list(null, null) or
   * client.webhook(null).load(java.util.Map.of("id", ...), null).
   */
  def webhook(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinpayconexsdk.entity.WebhookEntity(this, entopts)


}

object BluefinPayconexSDK {

  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  def testSDK(): BluefinPayconexSDK = testSDK(null, null)

  def testSDK(testopts: JMap[String, Object], sdkopts: JMap[String, Object]): BluefinPayconexSDK = {
    val sdk = new BluefinPayconexSDK(SdkClient.testOptions(testopts, sdkopts))
    sdk.mode = "test"
    sdk
  }
}
