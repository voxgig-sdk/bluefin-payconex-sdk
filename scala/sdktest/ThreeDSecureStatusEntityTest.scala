// Generated basic-flow test for the three_d_secure_status entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ThreeDSecureStatusTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ThreeDSecureStatusEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("three_d_secure_status.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.threeDSecureStatus(null)
      rep.check("three_d_secure_status.instance", ent != null, "expected non-null three_d_secure_status entity")
    }

    rep.scope("three_d_secure_status.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/three_d_secure_status/ThreeDSecureStatusTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("three_d_secure_status01", "THREE_D_SECURE_STATUS01")
      idmap.put("three_d_secure_status02", "THREE_D_SECURE_STATUS02")
      idmap.put("three_d_secure_status03", "THREE_D_SECURE_STATUS03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("3_d01", "3_D01")
      idmap.put("3_d02", "3_D02")
      idmap.put("3_d03", "3_D03")
      val now = System.currentTimeMillis()

      // LOAD
      val threeDSecureStatusRef01Ent = client.threeDSecureStatus(null)
      val threeDSecureStatusRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val threeDSecureStatusRef01DataDt0Loaded = threeDSecureStatusRef01Ent.load(threeDSecureStatusRef01MatchDt0, null)
      rep.check("three_d_secure_status.load.nonnull", threeDSecureStatusRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}
