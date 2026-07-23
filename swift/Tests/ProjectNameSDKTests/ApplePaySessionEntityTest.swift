// apple_pay_session entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class ApplePaySessionEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.ApplePaySession()
    XCTAssertEqual(ent.getName(), "apple_pay_session")
  }
}
