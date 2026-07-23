// Generated instance test for the three_d_secure_browser_init entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_three_d_secure_browser_init(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "three_d_secure_browser_init", "entity get_name");

  TEST_SUMMARY("three_d_secure_browser_init_entity");
}
