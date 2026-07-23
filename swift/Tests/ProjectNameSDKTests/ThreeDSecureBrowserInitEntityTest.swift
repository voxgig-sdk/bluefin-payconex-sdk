// three_d_secure_browser_init entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class ThreeDSecureBrowserInitEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.ThreeDSecureBrowserInit()
    XCTAssertEqual(ent.getName(), "three_d_secure_browser_init")
  }
}
