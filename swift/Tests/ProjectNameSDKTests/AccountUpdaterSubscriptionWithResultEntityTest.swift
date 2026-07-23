// account_updater_subscription_with_result entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class AccountUpdaterSubscriptionWithResultEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.AccountUpdaterSubscriptionWithResult()
    XCTAssertEqual(ent.getName(), "account_updater_subscription_with_result")
  }
}
