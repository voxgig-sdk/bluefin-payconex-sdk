// Generated basic-flow test for the payment_iframe entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped PaymentIframeTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object PaymentIframeEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("payment_iframe.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.paymentIframe(null)
      rep.check("payment_iframe.instance", ent != null, "expected non-null payment_iframe entity")
    }

    rep.scope("payment_iframe.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/payment_iframe/PaymentIframeTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("payment_iframe01", "PAYMENT_IFRAME01")
      idmap.put("payment_iframe02", "PAYMENT_IFRAME02")
      idmap.put("payment_iframe03", "PAYMENT_IFRAME03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()
    }
  }
}
