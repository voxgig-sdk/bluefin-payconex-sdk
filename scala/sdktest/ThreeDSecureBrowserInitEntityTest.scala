// Generated basic-flow test for the three_d_secure_browser_init entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ThreeDSecureBrowserInitTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ThreeDSecureBrowserInitEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("three_d_secure_browser_init.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.threeDSecureBrowserInit(null)
      rep.check("three_d_secure_browser_init.instance", ent != null, "expected non-null three_d_secure_browser_init entity")
    }

    rep.scope("three_d_secure_browser_init.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/three_d_secure_browser_init/ThreeDSecureBrowserInitTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("three_d_secure_browser_init01", "THREE_D_SECURE_BROWSER_INIT01")
      idmap.put("three_d_secure_browser_init02", "THREE_D_SECURE_BROWSER_INIT02")
      idmap.put("three_d_secure_browser_init03", "THREE_D_SECURE_BROWSER_INIT03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // CREATE
      val threeDSecureBrowserInitRef01Ent = client.threeDSecureBrowserInit(null)
      var threeDSecureBrowserInitRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.three_d_secure_browser_init"), "three_d_secure_browser_init_ref01"))
      threeDSecureBrowserInitRef01Data.put("account_id", idmap.get("account01"))
      val threeDSecureBrowserInitRef01DataResult = threeDSecureBrowserInitRef01Ent.create(threeDSecureBrowserInitRef01Data, null)
      threeDSecureBrowserInitRef01Data = Helpers.toMapAny(threeDSecureBrowserInitRef01DataResult)
      rep.check("three_d_secure_browser_init.create.map", threeDSecureBrowserInitRef01Data != null, "expected create result to be a map")
    }
  }
}
