// three_d_secure_auth entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class ThreeDSecureAuthEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.ThreeDSecureAuth()
    XCTAssertEqual(ent.getName(), "three_d_secure_auth")
  }
}
