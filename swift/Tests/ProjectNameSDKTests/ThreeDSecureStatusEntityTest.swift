// three_d_secure_status entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class ThreeDSecureStatusEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.ThreeDSecureStatus()
    XCTAssertEqual(ent.getName(), "three_d_secure_status")
  }
}
