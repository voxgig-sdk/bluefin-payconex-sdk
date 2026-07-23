// Aggregating entry point for the generated per-entity SDK tests. Drives
// every <Entity>EntityTest / <Entity>DirectTest object through one shared
// SdkTestReport and exits non-zero on any failure.
// Run: scala-cli run . --main-class SdkEntityTestMain

object SdkEntityTestMain {

  def main(args: Array[String]): Unit = {
    val rep = new SdkTestReport()

    AccountUpdaterEntityTest.run(rep)
    AccountUpdaterScheduleEntityTest.run(rep)
    AccountUpdaterScheduleWithResultEntityTest.run(rep)
    AccountUpdaterScheduleWithResultDirectTest.run(rep)
    AccountUpdaterSubscriptionWithResultEntityTest.run(rep)
    AccountUpdaterSubscriptionWithResultDirectTest.run(rep)
    AccountUpdaterUpdateEntityTest.run(rep)
    AccountUpdaterUpdateDirectTest.run(rep)
    ApiKeyEntityTest.run(rep)
    ApiKeyDirectTest.run(rep)
    ApplePayMerchantDetailEntityTest.run(rep)
    ApplePayMerchantDetailDirectTest.run(rep)
    ApplePaySessionEntityTest.run(rep)
    DynamicDescriptorEntityTest.run(rep)
    DynamicDescriptorDirectTest.run(rep)
    IFrameCreateInstanceEntityTest.run(rep)
    IFrameInstanceEntityTest.run(rep)
    IFrameInstanceDirectTest.run(rep)
    IframeEntityTest.run(rep)
    IframeDirectTest.run(rep)
    InitEntityTest.run(rep)
    ListApiKeyScopesEntryEntityTest.run(rep)
    ListApiKeyScopesEntryDirectTest.run(rep)
    PaymentIframeEntityTest.run(rep)
    ThreeDSecureAuthEntityTest.run(rep)
    ThreeDSecureBrowserInitEntityTest.run(rep)
    ThreeDSecureStatusEntityTest.run(rep)
    ThreeDSecureStatusDirectTest.run(rep)
    TransactionDetailEntityTest.run(rep)
    TransactionDetailDirectTest.run(rep)
    WebhookEntityTest.run(rep)
    WebhookDirectTest.run(rep)

    ReadmeExamplesTest.run(rep)

    rep.finish("ENTITY")
  }
}
