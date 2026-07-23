// payment_iframe entity test (generated from the API model).

import XCTest

@testable import BluefinPayconexSdk

final class PaymentIframeEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinPayconexSDK.testSDK(nil, nil)
    let ent = sdk.PaymentIframe()
    XCTAssertEqual(ent.getName(), "payment_iframe")
  }
}
