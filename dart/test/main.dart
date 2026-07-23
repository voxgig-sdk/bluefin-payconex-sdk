// BluefinPayconex SDK test suite entry. GENERATED — do not edit.

import 'dart:io';

import 'harness.dart' as harness;

import 'exists_test.dart' as exists_test;
import 'struct_test.dart' as struct_test;
import 'primary_test.dart' as primary_test;
import 'pipeline_test.dart' as pipeline_test;
import 'feature_test.dart' as feature_test;
import 'netsim_test.dart' as netsim_test;
import 'custom_test.dart' as custom_test;
import 'readme_examples_test.dart' as readme_examples_test;
import 'entity/account_updater/AccountUpdaterEntity_test.dart' as account_updater_entity_test;
import 'entity/account_updater_schedule/AccountUpdaterScheduleEntity_test.dart' as account_updater_schedule_entity_test;
import 'entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultEntity_test.dart' as account_updater_schedule_with_result_entity_test;
import 'entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultDirect_test.dart' as account_updater_schedule_with_result_direct_test;
import 'entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultEntity_test.dart' as account_updater_subscription_with_result_entity_test;
import 'entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultDirect_test.dart' as account_updater_subscription_with_result_direct_test;
import 'entity/account_updater_update/AccountUpdaterUpdateEntity_test.dart' as account_updater_update_entity_test;
import 'entity/account_updater_update/AccountUpdaterUpdateDirect_test.dart' as account_updater_update_direct_test;
import 'entity/api_key/ApiKeyEntity_test.dart' as api_key_entity_test;
import 'entity/api_key/ApiKeyDirect_test.dart' as api_key_direct_test;
import 'entity/apple_pay_merchant_detail/ApplePayMerchantDetailEntity_test.dart' as apple_pay_merchant_detail_entity_test;
import 'entity/apple_pay_merchant_detail/ApplePayMerchantDetailDirect_test.dart' as apple_pay_merchant_detail_direct_test;
import 'entity/apple_pay_session/ApplePaySessionEntity_test.dart' as apple_pay_session_entity_test;
import 'entity/dynamic_descriptor/DynamicDescriptorEntity_test.dart' as dynamic_descriptor_entity_test;
import 'entity/dynamic_descriptor/DynamicDescriptorDirect_test.dart' as dynamic_descriptor_direct_test;
import 'entity/i_frame_create_instance/IFrameCreateInstanceEntity_test.dart' as i_frame_create_instance_entity_test;
import 'entity/i_frame_instance/IFrameInstanceEntity_test.dart' as i_frame_instance_entity_test;
import 'entity/i_frame_instance/IFrameInstanceDirect_test.dart' as i_frame_instance_direct_test;
import 'entity/iframe/IframeEntity_test.dart' as iframe_entity_test;
import 'entity/iframe/IframeDirect_test.dart' as iframe_direct_test;
import 'entity/init/InitEntity_test.dart' as init_entity_test;
import 'entity/list_api_key_scopes_entry/ListApiKeyScopesEntryEntity_test.dart' as list_api_key_scopes_entry_entity_test;
import 'entity/list_api_key_scopes_entry/ListApiKeyScopesEntryDirect_test.dart' as list_api_key_scopes_entry_direct_test;
import 'entity/payment_iframe/PaymentIframeEntity_test.dart' as payment_iframe_entity_test;
import 'entity/three_d_secure_auth/ThreeDSecureAuthEntity_test.dart' as three_d_secure_auth_entity_test;
import 'entity/three_d_secure_browser_init/ThreeDSecureBrowserInitEntity_test.dart' as three_d_secure_browser_init_entity_test;
import 'entity/three_d_secure_status/ThreeDSecureStatusEntity_test.dart' as three_d_secure_status_entity_test;
import 'entity/three_d_secure_status/ThreeDSecureStatusDirect_test.dart' as three_d_secure_status_direct_test;
import 'entity/transaction_detail/TransactionDetailEntity_test.dart' as transaction_detail_entity_test;
import 'entity/transaction_detail/TransactionDetailDirect_test.dart' as transaction_detail_direct_test;
import 'entity/webhook/WebhookEntity_test.dart' as webhook_entity_test;
import 'entity/webhook/WebhookDirect_test.dart' as webhook_direct_test;

Future<void> main() async {
  exists_test.tests();
  struct_test.tests();
  primary_test.tests();
  pipeline_test.tests();
  feature_test.tests();
  netsim_test.tests();
  custom_test.tests();
  readme_examples_test.tests();
  account_updater_entity_test.tests();
  account_updater_schedule_entity_test.tests();
  account_updater_schedule_with_result_entity_test.tests();
  account_updater_schedule_with_result_direct_test.tests();
  account_updater_subscription_with_result_entity_test.tests();
  account_updater_subscription_with_result_direct_test.tests();
  account_updater_update_entity_test.tests();
  account_updater_update_direct_test.tests();
  api_key_entity_test.tests();
  api_key_direct_test.tests();
  apple_pay_merchant_detail_entity_test.tests();
  apple_pay_merchant_detail_direct_test.tests();
  apple_pay_session_entity_test.tests();
  dynamic_descriptor_entity_test.tests();
  dynamic_descriptor_direct_test.tests();
  i_frame_create_instance_entity_test.tests();
  i_frame_instance_entity_test.tests();
  i_frame_instance_direct_test.tests();
  iframe_entity_test.tests();
  iframe_direct_test.tests();
  init_entity_test.tests();
  list_api_key_scopes_entry_entity_test.tests();
  list_api_key_scopes_entry_direct_test.tests();
  payment_iframe_entity_test.tests();
  three_d_secure_auth_entity_test.tests();
  three_d_secure_browser_init_entity_test.tests();
  three_d_secure_status_entity_test.tests();
  three_d_secure_status_direct_test.tests();
  transaction_detail_entity_test.tests();
  transaction_detail_direct_test.tests();
  webhook_entity_test.tests();
  webhook_direct_test.tests();

  final failed = await harness.runAll();
  if (0 < failed) {
    exitCode = 1;
  }
}
