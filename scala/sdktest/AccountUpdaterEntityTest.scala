// Generated basic-flow test for the account_updater entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AccountUpdaterTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object AccountUpdaterEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("account_updater.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.accountUpdater(null)
      rep.check("account_updater.instance", ent != null, "expected non-null account_updater entity")
    }

    rep.scope("account_updater.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/account_updater/AccountUpdaterTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("account_updater01", "ACCOUNT_UPDATER01")
      idmap.put("account_updater02", "ACCOUNT_UPDATER02")
      idmap.put("account_updater03", "ACCOUNT_UPDATER03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("subscription01", "SUBSCRIPTION01")
      idmap.put("subscription02", "SUBSCRIPTION02")
      idmap.put("subscription03", "SUBSCRIPTION03")
      idmap.put("record01", "RECORD01")
      idmap.put("record02", "RECORD02")
      idmap.put("record03", "RECORD03")
      val now = System.currentTimeMillis()
    }
  }
}
