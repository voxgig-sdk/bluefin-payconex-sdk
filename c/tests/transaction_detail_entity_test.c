// Generated instance test for the transaction_detail entity.

#include "ctest.h"

int main(void) {
  BluefinPayconexSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinpayconex_transaction_detail(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "transaction_detail", "entity get_name");

  TEST_SUMMARY("transaction_detail_entity");
}
