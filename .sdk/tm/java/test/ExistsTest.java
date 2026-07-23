package JAVAPACKAGE.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import JAVAPACKAGE.core.BluefinPayconexSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}
