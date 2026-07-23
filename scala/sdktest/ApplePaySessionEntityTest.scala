// Generated basic-flow test for the apple_pay_session entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ApplePaySessionTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ApplePaySessionEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("apple_pay_session.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.applePaySession(null)
      rep.check("apple_pay_session.instance", ent != null, "expected non-null apple_pay_session entity")
    }

    rep.scope("apple_pay_session.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/apple_pay_session/ApplePaySessionTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("apple_pay_session01", "APPLE_PAY_SESSION01")
      idmap.put("apple_pay_session02", "APPLE_PAY_SESSION02")
      idmap.put("apple_pay_session03", "APPLE_PAY_SESSION03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // CREATE
      val applePaySessionRef01Ent = client.applePaySession(null)
      var applePaySessionRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.apple_pay_session"), "apple_pay_session_ref01"))
      applePaySessionRef01Data.put("account_id", idmap.get("account01"))
      val applePaySessionRef01DataResult = applePaySessionRef01Ent.create(applePaySessionRef01Data, null)
      applePaySessionRef01Data = Helpers.toMapAny(applePaySessionRef01DataResult)
      rep.check("apple_pay_session.create.map", applePaySessionRef01Data != null, "expected create result to be a map")
    }
  }
}
