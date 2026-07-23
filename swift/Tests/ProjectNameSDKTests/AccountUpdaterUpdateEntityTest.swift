// account_updater_update entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class AccountUpdaterUpdateEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.AccountUpdaterUpdate()
    XCTAssertEqual(ent.getName(), "account_updater_update")
  }
}
