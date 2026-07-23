package voxgig.bluefinpayconexsdk.core;

import java.util.Map;

/**
 * BluefinPayconex SDK client. All transport and pipeline behaviour lives in
 * the SdkClient base (core/SdkClient.java); this class binds the
 * API-specific entity accessors and the test-mode constructor.
 */
public class BluefinPayconexSDK extends SdkClient {

  public BluefinPayconexSDK() {
    this(null);
  }

  public BluefinPayconexSDK(Map<String, Object> options) {
    super(options);
  }


  /**
   * Returns a account_updater entity bound to this client.
   * Idiomatic usage: client.accountUpdater(null).list(null, null) or
   * client.accountUpdater(null).load(Map.of("id", ...), null).
   */
  public SdkEntity accountUpdater(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.AccountUpdaterEntity(this, entopts);
  }

  /**
   * Returns a account_updater_schedule entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSchedule(null).list(null, null) or
   * client.accountUpdaterSchedule(null).load(Map.of("id", ...), null).
   */
  public SdkEntity accountUpdaterSchedule(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleEntity(this, entopts);
  }

  /**
   * Returns a account_updater_schedule_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterScheduleWithResult(null).list(null, null) or
   * client.accountUpdaterScheduleWithResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity accountUpdaterScheduleWithResult(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.AccountUpdaterScheduleWithResultEntity(this, entopts);
  }

  /**
   * Returns a account_updater_subscription_with_result entity bound to this client.
   * Idiomatic usage: client.accountUpdaterSubscriptionWithResult(null).list(null, null) or
   * client.accountUpdaterSubscriptionWithResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity accountUpdaterSubscriptionWithResult(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.AccountUpdaterSubscriptionWithResultEntity(this, entopts);
  }

  /**
   * Returns a account_updater_update entity bound to this client.
   * Idiomatic usage: client.accountUpdaterUpdate(null).list(null, null) or
   * client.accountUpdaterUpdate(null).load(Map.of("id", ...), null).
   */
  public SdkEntity accountUpdaterUpdate(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.AccountUpdaterUpdateEntity(this, entopts);
  }

  /**
   * Returns a api_key entity bound to this client.
   * Idiomatic usage: client.apiKey(null).list(null, null) or
   * client.apiKey(null).load(Map.of("id", ...), null).
   */
  public SdkEntity apiKey(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ApiKeyEntity(this, entopts);
  }

  /**
   * Returns a apple_pay_merchant_detail entity bound to this client.
   * Idiomatic usage: client.applePayMerchantDetail(null).list(null, null) or
   * client.applePayMerchantDetail(null).load(Map.of("id", ...), null).
   */
  public SdkEntity applePayMerchantDetail(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ApplePayMerchantDetailEntity(this, entopts);
  }

  /**
   * Returns a apple_pay_session entity bound to this client.
   * Idiomatic usage: client.applePaySession(null).list(null, null) or
   * client.applePaySession(null).load(Map.of("id", ...), null).
   */
  public SdkEntity applePaySession(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ApplePaySessionEntity(this, entopts);
  }

  /**
   * Returns a dynamic_descriptor entity bound to this client.
   * Idiomatic usage: client.dynamicDescriptor(null).list(null, null) or
   * client.dynamicDescriptor(null).load(Map.of("id", ...), null).
   */
  public SdkEntity dynamicDescriptor(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.DynamicDescriptorEntity(this, entopts);
  }

  /**
   * Returns a i_frame_create_instance entity bound to this client.
   * Idiomatic usage: client.iFrameCreateInstance(null).list(null, null) or
   * client.iFrameCreateInstance(null).load(Map.of("id", ...), null).
   */
  public SdkEntity iFrameCreateInstance(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.IFrameCreateInstanceEntity(this, entopts);
  }

  /**
   * Returns a i_frame_instance entity bound to this client.
   * Idiomatic usage: client.iFrameInstance(null).list(null, null) or
   * client.iFrameInstance(null).load(Map.of("id", ...), null).
   */
  public SdkEntity iFrameInstance(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.IFrameInstanceEntity(this, entopts);
  }

  /**
   * Returns a iframe entity bound to this client.
   * Idiomatic usage: client.iframe(null).list(null, null) or
   * client.iframe(null).load(Map.of("id", ...), null).
   */
  public SdkEntity iframe(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.IframeEntity(this, entopts);
  }

  /**
   * Returns a init entity bound to this client.
   * Idiomatic usage: client.init(null).list(null, null) or
   * client.init(null).load(Map.of("id", ...), null).
   */
  public SdkEntity init(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.InitEntity(this, entopts);
  }

  /**
   * Returns a list_api_key_scopes_entry entity bound to this client.
   * Idiomatic usage: client.listApiKeyScopesEntry(null).list(null, null) or
   * client.listApiKeyScopesEntry(null).load(Map.of("id", ...), null).
   */
  public SdkEntity listApiKeyScopesEntry(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ListApiKeyScopesEntryEntity(this, entopts);
  }

  /**
   * Returns a payment_iframe entity bound to this client.
   * Idiomatic usage: client.paymentIframe(null).list(null, null) or
   * client.paymentIframe(null).load(Map.of("id", ...), null).
   */
  public SdkEntity paymentIframe(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.PaymentIframeEntity(this, entopts);
  }

  /**
   * Returns a three_d_secure_auth entity bound to this client.
   * Idiomatic usage: client.threeDSecureAuth(null).list(null, null) or
   * client.threeDSecureAuth(null).load(Map.of("id", ...), null).
   */
  public SdkEntity threeDSecureAuth(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ThreeDSecureAuthEntity(this, entopts);
  }

  /**
   * Returns a three_d_secure_browser_init entity bound to this client.
   * Idiomatic usage: client.threeDSecureBrowserInit(null).list(null, null) or
   * client.threeDSecureBrowserInit(null).load(Map.of("id", ...), null).
   */
  public SdkEntity threeDSecureBrowserInit(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ThreeDSecureBrowserInitEntity(this, entopts);
  }

  /**
   * Returns a three_d_secure_status entity bound to this client.
   * Idiomatic usage: client.threeDSecureStatus(null).list(null, null) or
   * client.threeDSecureStatus(null).load(Map.of("id", ...), null).
   */
  public SdkEntity threeDSecureStatus(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.ThreeDSecureStatusEntity(this, entopts);
  }

  /**
   * Returns a transaction_detail entity bound to this client.
   * Idiomatic usage: client.transactionDetail(null).list(null, null) or
   * client.transactionDetail(null).load(Map.of("id", ...), null).
   */
  public SdkEntity transactionDetail(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.TransactionDetailEntity(this, entopts);
  }

  /**
   * Returns a webhook entity bound to this client.
   * Idiomatic usage: client.webhook(null).list(null, null) or
   * client.webhook(null).load(Map.of("id", ...), null).
   */
  public SdkEntity webhook(Map<String, Object> entopts) {
    return new voxgig.bluefinpayconexsdk.entity.WebhookEntity(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  public static BluefinPayconexSDK testSDK() {
    return testSDK(null, null);
  }

  public static BluefinPayconexSDK testSDK(
      Map<String, Object> testopts, Map<String, Object> sdkopts) {
    BluefinPayconexSDK sdk = new BluefinPayconexSDK(SdkClient.testOptions(testopts, sdkopts));
    sdk.mode = "test";
    return sdk;
  }
}
