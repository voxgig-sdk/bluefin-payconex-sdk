// account_updater_schedule entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class AccountUpdaterScheduleEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.AccountUpdaterSchedule()
    XCTAssertEqual(ent.getName(), "account_updater_schedule")
  }
}
