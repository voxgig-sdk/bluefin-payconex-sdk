// init entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class InitEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.Init()
    XCTAssertEqual(ent.getName(), "init")
  }
}
