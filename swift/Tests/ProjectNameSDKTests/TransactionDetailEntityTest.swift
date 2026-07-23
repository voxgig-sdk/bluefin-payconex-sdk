// transaction_detail entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class TransactionDetailEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.TransactionDetail()
    XCTAssertEqual(ent.getName(), "transaction_detail")
  }
}
