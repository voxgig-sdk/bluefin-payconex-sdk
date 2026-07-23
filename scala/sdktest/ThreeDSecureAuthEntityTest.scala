// Generated basic-flow test for the three_d_secure_auth entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ThreeDSecureAuthTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ThreeDSecureAuthEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("three_d_secure_auth.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.threeDSecureAuth(null)
      rep.check("three_d_secure_auth.instance", ent != null, "expected non-null three_d_secure_auth entity")
    }

    rep.scope("three_d_secure_auth.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/three_d_secure_auth/ThreeDSecureAuthTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("three_d_secure_auth01", "THREE_D_SECURE_AUTH01")
      idmap.put("three_d_secure_auth02", "THREE_D_SECURE_AUTH02")
      idmap.put("three_d_secure_auth03", "THREE_D_SECURE_AUTH03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("3_d01", "3_D01")
      idmap.put("3_d02", "3_D02")
      idmap.put("3_d03", "3_D03")
      val now = System.currentTimeMillis()

      // CREATE
      val threeDSecureAuthRef01Ent = client.threeDSecureAuth(null)
      var threeDSecureAuthRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.three_d_secure_auth"), "three_d_secure_auth_ref01"))
      threeDSecureAuthRef01Data.put("3_d_id", idmap.get("3_d01"))
      threeDSecureAuthRef01Data.put("account_id", idmap.get("account01"))
      val threeDSecureAuthRef01DataResult = threeDSecureAuthRef01Ent.create(threeDSecureAuthRef01Data, null)
      threeDSecureAuthRef01Data = Helpers.toMapAny(threeDSecureAuthRef01DataResult)
      rep.check("three_d_secure_auth.create.map", threeDSecureAuthRef01Data != null, "expected create result to be a map")
    }
  }
}
