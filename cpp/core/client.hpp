// BluefinPayconex SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/types.hpp); this class binds the API-specific entity
// accessors and the test-mode constructor.

#ifndef SDK_CORE_CLIENT_HPP
#define SDK_CORE_CLIENT_HPP

#include <memory>

#include "../core/types.hpp"
#include "../entity/entities.hpp"

namespace sdk {

class BluefinPayconexSDK : public SdkClient {
public:
  explicit BluefinPayconexSDK(Value options = Value::undef()) : SdkClient(options) {}


  // AccountUpdater entity bound to this client.
  std::shared_ptr<AccountUpdaterEntity> account_updater(Value entopts = Value::undef()) {
    return std::make_shared<AccountUpdaterEntity>(this, entopts);
  }

  // AccountUpdaterSchedule entity bound to this client.
  std::shared_ptr<AccountUpdaterScheduleEntity> account_updater_schedule(Value entopts = Value::undef()) {
    return std::make_shared<AccountUpdaterScheduleEntity>(this, entopts);
  }

  // AccountUpdaterScheduleWithResult entity bound to this client.
  std::shared_ptr<AccountUpdaterScheduleWithResultEntity> account_updater_schedule_with_result(Value entopts = Value::undef()) {
    return std::make_shared<AccountUpdaterScheduleWithResultEntity>(this, entopts);
  }

  // AccountUpdaterSubscriptionWithResult entity bound to this client.
  std::shared_ptr<AccountUpdaterSubscriptionWithResultEntity> account_updater_subscription_with_result(Value entopts = Value::undef()) {
    return std::make_shared<AccountUpdaterSubscriptionWithResultEntity>(this, entopts);
  }

  // AccountUpdaterUpdate entity bound to this client.
  std::shared_ptr<AccountUpdaterUpdateEntity> account_updater_update(Value entopts = Value::undef()) {
    return std::make_shared<AccountUpdaterUpdateEntity>(this, entopts);
  }

  // ApiKey entity bound to this client.
  std::shared_ptr<ApiKeyEntity> api_key(Value entopts = Value::undef()) {
    return std::make_shared<ApiKeyEntity>(this, entopts);
  }

  // ApplePayMerchantDetail entity bound to this client.
  std::shared_ptr<ApplePayMerchantDetailEntity> apple_pay_merchant_detail(Value entopts = Value::undef()) {
    return std::make_shared<ApplePayMerchantDetailEntity>(this, entopts);
  }

  // ApplePaySession entity bound to this client.
  std::shared_ptr<ApplePaySessionEntity> apple_pay_session(Value entopts = Value::undef()) {
    return std::make_shared<ApplePaySessionEntity>(this, entopts);
  }

  // DynamicDescriptor entity bound to this client.
  std::shared_ptr<DynamicDescriptorEntity> dynamic_descriptor(Value entopts = Value::undef()) {
    return std::make_shared<DynamicDescriptorEntity>(this, entopts);
  }

  // IFrameCreateInstance entity bound to this client.
  std::shared_ptr<IFrameCreateInstanceEntity> i_frame_create_instance(Value entopts = Value::undef()) {
    return std::make_shared<IFrameCreateInstanceEntity>(this, entopts);
  }

  // IFrameInstance entity bound to this client.
  std::shared_ptr<IFrameInstanceEntity> i_frame_instance(Value entopts = Value::undef()) {
    return std::make_shared<IFrameInstanceEntity>(this, entopts);
  }

  // Iframe entity bound to this client.
  std::shared_ptr<IframeEntity> iframe(Value entopts = Value::undef()) {
    return std::make_shared<IframeEntity>(this, entopts);
  }

  // Init entity bound to this client.
  std::shared_ptr<InitEntity> init(Value entopts = Value::undef()) {
    return std::make_shared<InitEntity>(this, entopts);
  }

  // ListApiKeyScopesEntry entity bound to this client.
  std::shared_ptr<ListApiKeyScopesEntryEntity> list_api_key_scopes_entry(Value entopts = Value::undef()) {
    return std::make_shared<ListApiKeyScopesEntryEntity>(this, entopts);
  }

  // PaymentIframe entity bound to this client.
  std::shared_ptr<PaymentIframeEntity> payment_iframe(Value entopts = Value::undef()) {
    return std::make_shared<PaymentIframeEntity>(this, entopts);
  }

  // ThreeDSecureAuth entity bound to this client.
  std::shared_ptr<ThreeDSecureAuthEntity> three_d_secure_auth(Value entopts = Value::undef()) {
    return std::make_shared<ThreeDSecureAuthEntity>(this, entopts);
  }

  // ThreeDSecureBrowserInit entity bound to this client.
  std::shared_ptr<ThreeDSecureBrowserInitEntity> three_d_secure_browser_init(Value entopts = Value::undef()) {
    return std::make_shared<ThreeDSecureBrowserInitEntity>(this, entopts);
  }

  // ThreeDSecureStatus entity bound to this client.
  std::shared_ptr<ThreeDSecureStatusEntity> three_d_secure_status(Value entopts = Value::undef()) {
    return std::make_shared<ThreeDSecureStatusEntity>(this, entopts);
  }

  // TransactionDetail entity bound to this client.
  std::shared_ptr<TransactionDetailEntity> transaction_detail(Value entopts = Value::undef()) {
    return std::make_shared<TransactionDetailEntity>(this, entopts);
  }

  // Webhook entity bound to this client.
  std::shared_ptr<WebhookEntity> webhook(Value entopts = Value::undef()) {
    return std::make_shared<WebhookEntity>(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  static std::shared_ptr<BluefinPayconexSDK> testSDK() {
    return testSDK(Value::undef(), Value::undef());
  }

  static std::shared_ptr<BluefinPayconexSDK> testSDK(Value testopts, Value sdkopts) {
    auto sdk = std::make_shared<BluefinPayconexSDK>(SdkClient::testOptions(testopts, sdkopts));
    sdk->mode = "test";
    return sdk;
  }

  // Convenience no-arg constructor.
  static std::shared_ptr<BluefinPayconexSDK> create() {
    return std::make_shared<BluefinPayconexSDK>(Value::undef());
  }
};

using BluefinPayconexSDKPtr = std::shared_ptr<BluefinPayconexSDK>;

} // namespace sdk

#endif // SDK_CORE_CLIENT_HPP
