// Generated basic-flow test for the init entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped InitTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object InitEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("init.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.init(null)
      rep.check("init.instance", ent != null, "expected non-null init entity")
    }

    rep.scope("init.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/init/InitTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("init01", "INIT01")
      idmap.put("init02", "INIT02")
      idmap.put("init03", "INIT03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // CREATE
      val initRef01Ent = client.init(null)
      var initRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.init"), "init_ref01"))
      initRef01Data.put("account_id", idmap.get("account01"))
      val initRef01DataResult = initRef01Ent.create(initRef01Data, null)
      initRef01Data = Helpers.toMapAny(initRef01DataResult)
      rep.check("init.create.map", initRef01Data != null, "expected create result to be a map")
    }
  }
}
