// Generated basic-flow test for the account_updater_schedule entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AccountUpdaterScheduleTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object AccountUpdaterScheduleEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("account_updater_schedule.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.accountUpdaterSchedule(null)
      rep.check("account_updater_schedule.instance", ent != null, "expected non-null account_updater_schedule entity")
    }

    rep.scope("account_updater_schedule.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/account_updater_schedule/AccountUpdaterScheduleTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("account_updater_schedule01", "ACCOUNT_UPDATER_SCHEDULE01")
      idmap.put("account_updater_schedule02", "ACCOUNT_UPDATER_SCHEDULE02")
      idmap.put("account_updater_schedule03", "ACCOUNT_UPDATER_SCHEDULE03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // CREATE
      val accountUpdaterScheduleRef01Ent = client.accountUpdaterSchedule(null)
      var accountUpdaterScheduleRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.account_updater_schedule"), "account_updater_schedule_ref01"))
      accountUpdaterScheduleRef01Data.put("account_id", idmap.get("account01"))
      val accountUpdaterScheduleRef01DataResult = accountUpdaterScheduleRef01Ent.create(accountUpdaterScheduleRef01Data, null)
      accountUpdaterScheduleRef01Data = Helpers.toMapAny(accountUpdaterScheduleRef01DataResult)
      rep.check("account_updater_schedule.create.map", accountUpdaterScheduleRef01Data != null, "expected create result to be a map")
    }
  }
}
