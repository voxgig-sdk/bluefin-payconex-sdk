// Generated basic-flow test for the account_updater_update entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AccountUpdaterUpdateTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object AccountUpdaterUpdateEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("account_updater_update.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.accountUpdaterUpdate(null)
      rep.check("account_updater_update.instance", ent != null, "expected non-null account_updater_update entity")
    }

    rep.scope("account_updater_update.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/account_updater_update/AccountUpdaterUpdateTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("account_updater_update01", "ACCOUNT_UPDATER_UPDATE01")
      idmap.put("account_updater_update02", "ACCOUNT_UPDATER_UPDATE02")
      idmap.put("account_updater_update03", "ACCOUNT_UPDATER_UPDATE03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // LOAD
      val accountUpdaterUpdateRef01Ent = client.accountUpdaterUpdate(null)
      val accountUpdaterUpdateRef01MatchDt0 = new LinkedHashMap[String, Object]()
      accountUpdaterUpdateRef01MatchDt0.put("id", accountUpdaterUpdateRef01Data.get("id"))
      val accountUpdaterUpdateRef01DataDt0Loaded = accountUpdaterUpdateRef01Ent.load(accountUpdaterUpdateRef01MatchDt0, null)
      val accountUpdaterUpdateRef01DataDt0LoadResult = Helpers.toMapAny(accountUpdaterUpdateRef01DataDt0Loaded)
      rep.check("account_updater_update.load.map", accountUpdaterUpdateRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("account_updater_update.load.id", accountUpdaterUpdateRef01Data.get("id"), accountUpdaterUpdateRef01DataDt0LoadResult.get("id"))
    }
  }
}
