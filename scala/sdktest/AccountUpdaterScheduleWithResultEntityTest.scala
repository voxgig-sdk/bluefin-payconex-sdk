// Generated basic-flow test for the account_updater_schedule_with_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AccountUpdaterScheduleWithResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object AccountUpdaterScheduleWithResultEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("account_updater_schedule_with_result.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.accountUpdaterScheduleWithResult(null)
      rep.check("account_updater_schedule_with_result.instance", ent != null, "expected non-null account_updater_schedule_with_result entity")
    }

    rep.scope("account_updater_schedule_with_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("account_updater_schedule_with_result01", "ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT01")
      idmap.put("account_updater_schedule_with_result02", "ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT02")
      idmap.put("account_updater_schedule_with_result03", "ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("schedule01", "SCHEDULE01")
      idmap.put("schedule02", "SCHEDULE02")
      idmap.put("schedule03", "SCHEDULE03")
      val now = System.currentTimeMillis()

      // CREATE
      val accountUpdaterScheduleWithResultRef01Ent = client.accountUpdaterScheduleWithResult(null)
      var accountUpdaterScheduleWithResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.account_updater_schedule_with_result"), "account_updater_schedule_with_result_ref01"))
      accountUpdaterScheduleWithResultRef01Data.put("account_id", idmap.get("account01"))
      accountUpdaterScheduleWithResultRef01Data.put("schedule_id", idmap.get("schedule01"))
      val accountUpdaterScheduleWithResultRef01DataResult = accountUpdaterScheduleWithResultRef01Ent.create(accountUpdaterScheduleWithResultRef01Data, null)
      accountUpdaterScheduleWithResultRef01Data = Helpers.toMapAny(accountUpdaterScheduleWithResultRef01DataResult)
      rep.check("account_updater_schedule_with_result.create.map", accountUpdaterScheduleWithResultRef01Data != null, "expected create result to be a map")
      rep.check("account_updater_schedule_with_result.create.id", accountUpdaterScheduleWithResultRef01Data != null && accountUpdaterScheduleWithResultRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val accountUpdaterScheduleWithResultRef01Match = new LinkedHashMap[String, Object]()
      accountUpdaterScheduleWithResultRef01Match.put("account_id", idmap.get("account01"))
      accountUpdaterScheduleWithResultRef01Match.put("schedule_id", idmap.get("schedule01"))
      val accountUpdaterScheduleWithResultRef01ListResult = accountUpdaterScheduleWithResultRef01Ent.list(accountUpdaterScheduleWithResultRef01Match, null)
      rep.check("account_updater_schedule_with_result.list.islist", accountUpdaterScheduleWithResultRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + accountUpdaterScheduleWithResultRef01ListResult)
      val accountUpdaterScheduleWithResultRef01List = accountUpdaterScheduleWithResultRef01ListResult.asInstanceOf[JList[Object]]
      val accountUpdaterScheduleWithResultRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(accountUpdaterScheduleWithResultRef01List), SdkTestSupport.om("id" -> accountUpdaterScheduleWithResultRef01Data.get("id")))
      rep.check("account_updater_schedule_with_result.list.exists", !Struct.isempty(accountUpdaterScheduleWithResultRef01ListFound), "expected to find created entity in list")
    }
  }
}
