package voxgig.bluefinpayconexsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import voxgig.bluefinpayconexsdk.core.BluefinPayconexSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}
