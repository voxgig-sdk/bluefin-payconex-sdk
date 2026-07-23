// BluefinPayconex SDK exists test.

import XCTest

@testable import BluefinPayconexSdk

final class ExistsTest: XCTestCase {
  func testMode() {
    let testsdk = BluefinPayconexSDK.testSDK(nil, nil)
    XCTAssertEqual(testsdk.mode, "test")
  }
}
