// Generated basic-flow test for the account_updater_subscription_with_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AccountUpdaterSubscriptionWithResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object AccountUpdaterSubscriptionWithResultEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("account_updater_subscription_with_result.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.accountUpdaterSubscriptionWithResult(null)
      rep.check("account_updater_subscription_with_result.instance", ent != null, "expected non-null account_updater_subscription_with_result entity")
    }

    rep.scope("account_updater_subscription_with_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("account_updater_subscription_with_result01", "ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT01")
      idmap.put("account_updater_subscription_with_result02", "ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT02")
      idmap.put("account_updater_subscription_with_result03", "ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("subscription01", "SUBSCRIPTION01")
      idmap.put("subscription02", "SUBSCRIPTION02")
      idmap.put("subscription03", "SUBSCRIPTION03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()

      // CREATE
      val accountUpdaterSubscriptionWithResultRef01Ent = client.accountUpdaterSubscriptionWithResult(null)
      var accountUpdaterSubscriptionWithResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01"))
      accountUpdaterSubscriptionWithResultRef01Data.put("account_id", idmap.get("account01"))
      accountUpdaterSubscriptionWithResultRef01Data.put("subscription_id", idmap.get("subscription01"))
      val accountUpdaterSubscriptionWithResultRef01DataResult = accountUpdaterSubscriptionWithResultRef01Ent.create(accountUpdaterSubscriptionWithResultRef01Data, null)
      accountUpdaterSubscriptionWithResultRef01Data = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataResult)
      rep.check("account_updater_subscription_with_result.create.map", accountUpdaterSubscriptionWithResultRef01Data != null, "expected create result to be a map")
      rep.check("account_updater_subscription_with_result.create.id", accountUpdaterSubscriptionWithResultRef01Data != null && accountUpdaterSubscriptionWithResultRef01Data.get("id") != null, "expected created entity to have an id")

      // UPDATE
      val accountUpdaterSubscriptionWithResultRef01DataUp0Up = new LinkedHashMap[String, Object]()
      accountUpdaterSubscriptionWithResultRef01DataUp0Up.put("id", accountUpdaterSubscriptionWithResultRef01Data.get("id"))
      accountUpdaterSubscriptionWithResultRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name = "created_at"
      val accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value = "Mark01-account_updater_subscription_with_result_ref01_" + now
      accountUpdaterSubscriptionWithResultRef01DataUp0Up.put(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name, accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value)
      val accountUpdaterSubscriptionWithResultRef01ResdataUp0Result = accountUpdaterSubscriptionWithResultRef01Ent.update(accountUpdaterSubscriptionWithResultRef01DataUp0Up, null)
      val accountUpdaterSubscriptionWithResultRef01ResdataUp0 = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01ResdataUp0Result)
      rep.check("account_updater_subscription_with_result.update.map", accountUpdaterSubscriptionWithResultRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("account_updater_subscription_with_result.update.id", accountUpdaterSubscriptionWithResultRef01DataUp0Up.get("id"), accountUpdaterSubscriptionWithResultRef01ResdataUp0.get("id"))
      rep.eq("account_updater_subscription_with_result.update.mark", accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value, accountUpdaterSubscriptionWithResultRef01ResdataUp0.get(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name))

      // LOAD
      val accountUpdaterSubscriptionWithResultRef01MatchDt0 = new LinkedHashMap[String, Object]()
      accountUpdaterSubscriptionWithResultRef01MatchDt0.put("id", accountUpdaterSubscriptionWithResultRef01Data.get("id"))
      val accountUpdaterSubscriptionWithResultRef01DataDt0Loaded = accountUpdaterSubscriptionWithResultRef01Ent.load(accountUpdaterSubscriptionWithResultRef01MatchDt0, null)
      val accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataDt0Loaded)
      rep.check("account_updater_subscription_with_result.load.map", accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("account_updater_subscription_with_result.load.id", accountUpdaterSubscriptionWithResultRef01Data.get("id"), accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult.get("id"))
    }
  }
}
