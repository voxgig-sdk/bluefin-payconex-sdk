// account_updater entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class AccountUpdaterEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.AccountUpdater()
    XCTAssertEqual(ent.getName(), "account_updater")
  }
}
