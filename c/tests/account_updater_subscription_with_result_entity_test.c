// Generated instance test for the account_updater_subscription_with_result entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_account_updater_subscription_with_result(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "account_updater_subscription_with_result", "entity get_name");

  TEST_SUMMARY("account_updater_subscription_with_result_entity");
}
