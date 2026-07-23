// i_frame_create_instance entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class IFrameCreateInstanceEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.IFrameCreateInstance()
    XCTAssertEqual(ent.getName(), "i_frame_create_instance")
  }
}
