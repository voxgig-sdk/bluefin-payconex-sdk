// Generated instance test for the i_frame_create_instance entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_i_frame_create_instance(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "i_frame_create_instance", "entity get_name");

  TEST_SUMMARY("i_frame_create_instance_entity");
}
