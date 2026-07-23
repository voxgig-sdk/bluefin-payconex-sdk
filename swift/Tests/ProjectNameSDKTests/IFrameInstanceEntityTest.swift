// i_frame_instance entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class IFrameInstanceEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.IFrameInstance()
    XCTAssertEqual(ent.getName(), "i_frame_instance")
  }
}
