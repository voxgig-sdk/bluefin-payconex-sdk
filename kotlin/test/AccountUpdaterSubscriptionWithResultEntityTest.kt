package voxgig.bluefinpayconexsdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefinpayconexsdk.core.Helpers
import voxgig.bluefinpayconexsdk.core.SdkEntity
import voxgig.bluefinpayconexsdk.core.BluefinPayconexSDK
import voxgig.bluefinpayconexsdk.utility.Json
import voxgig.bluefinpayconexsdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class AccountUpdaterSubscriptionWithResultEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.accountUpdaterSubscriptionWithResult(null)
    assertNotNull(ent, "expected non-null account_updater_subscription_with_result entity")
  }

  @Test
  fun basic() {
    val setup = accountUpdaterSubscriptionWithResultBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "update", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "account_updater_subscription_with_result.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val accountUpdaterSubscriptionWithResultRef01Ent = client.accountUpdaterSubscriptionWithResult(null)
    var accountUpdaterSubscriptionWithResultRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01")) ?: linkedMapOf())
    accountUpdaterSubscriptionWithResultRef01Data["account_id"] = setup.idmap!!["account01"]
    accountUpdaterSubscriptionWithResultRef01Data["subscription_id"] = setup.idmap!!["subscription01"]

    val accountUpdaterSubscriptionWithResultRef01DataResult = accountUpdaterSubscriptionWithResultRef01Ent.create(accountUpdaterSubscriptionWithResultRef01Data, null)
    accountUpdaterSubscriptionWithResultRef01Data = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataResult) ?: linkedMapOf()
    assertNotNull(accountUpdaterSubscriptionWithResultRef01Data, "expected create result to be a map")
    assertNotNull(accountUpdaterSubscriptionWithResultRef01Data["id"], "expected created entity to have an id")

    // UPDATE
    val accountUpdaterSubscriptionWithResultRef01DataUp0Up = linkedMapOf<String, Any?>()
    accountUpdaterSubscriptionWithResultRef01DataUp0Up["id"] = accountUpdaterSubscriptionWithResultRef01Data["id"]
    accountUpdaterSubscriptionWithResultRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name = "created_at"
    val accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value = "Mark01-account_updater_subscription_with_result_ref01_" + setup.now
    accountUpdaterSubscriptionWithResultRef01DataUp0Up[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name] = accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value

    val accountUpdaterSubscriptionWithResultRef01ResdataUp0Result = accountUpdaterSubscriptionWithResultRef01Ent.update(accountUpdaterSubscriptionWithResultRef01DataUp0Up, null)
    val accountUpdaterSubscriptionWithResultRef01ResdataUp0 = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(accountUpdaterSubscriptionWithResultRef01ResdataUp0, "expected update result to be a map")
    assertEquals(accountUpdaterSubscriptionWithResultRef01DataUp0Up["id"], accountUpdaterSubscriptionWithResultRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value, accountUpdaterSubscriptionWithResultRef01ResdataUp0[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name],
        "expected " + accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val accountUpdaterSubscriptionWithResultRef01MatchDt0 = linkedMapOf<String, Any?>()
    accountUpdaterSubscriptionWithResultRef01MatchDt0["id"] = accountUpdaterSubscriptionWithResultRef01Data["id"]
    val accountUpdaterSubscriptionWithResultRef01DataDt0Loaded = accountUpdaterSubscriptionWithResultRef01Ent.load(accountUpdaterSubscriptionWithResultRef01MatchDt0, null)
    val accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(accountUpdaterSubscriptionWithResultRef01Data["id"], accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  companion object {
    fun accountUpdaterSubscriptionWithResultBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "account_updater_subscription_with_result", "AccountUpdaterSubscriptionWithResultTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read account_updater_subscription_with_result test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("account_updater_subscription_with_result01")
      idnames.add("account_updater_subscription_with_result02")
      idnames.add("account_updater_subscription_with_result03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      idnames.add("subscription01")
      idnames.add("subscription02")
      idnames.add("subscription03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }
      // Add account_id alias for update test.
      if (idmapResolved["account_id"] == null) {
        idmapResolved["account_id"] = idmapResolved["account01"]
      }

      val live = "TRUE" == env["BLUEFINPAYCONEX_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFINPAYCONEX_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinPayconexSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFINPAYCONEX_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}
