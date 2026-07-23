package KOTLINPACKAGE.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import KOTLINPACKAGE.core.BluefinPayconexSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinPayconexSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}
