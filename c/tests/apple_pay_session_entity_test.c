// Generated instance test for the apple_pay_session entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_apple_pay_session(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "apple_pay_session", "entity get_name");

  TEST_SUMMARY("apple_pay_session_entity");
}
