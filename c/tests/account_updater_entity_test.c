// Generated instance test for the account_updater entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_account_updater(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "account_updater", "entity get_name");

  TEST_SUMMARY("account_updater_entity");
}
