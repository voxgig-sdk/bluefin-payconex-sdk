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
class AccountUpdaterScheduleWithResultEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.accountUpdaterScheduleWithResult(null)
    assertNotNull(ent, "expected non-null account_updater_schedule_with_result entity")
  }

  @Test
  fun basic() {
    val setup = accountUpdaterScheduleWithResultBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list")) {
      val reason = RunnerSupport.skipReason("entityOp", "account_updater_schedule_with_result.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val accountUpdaterScheduleWithResultRef01Ent = client.accountUpdaterScheduleWithResult(null)
    var accountUpdaterScheduleWithResultRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.account_updater_schedule_with_result"), "account_updater_schedule_with_result_ref01")) ?: linkedMapOf())
    accountUpdaterScheduleWithResultRef01Data["account_id"] = setup.idmap!!["account01"]
    accountUpdaterScheduleWithResultRef01Data["schedule_id"] = setup.idmap!!["schedule01"]

    val accountUpdaterScheduleWithResultRef01DataResult = accountUpdaterScheduleWithResultRef01Ent.create(accountUpdaterScheduleWithResultRef01Data, null)
    accountUpdaterScheduleWithResultRef01Data = Helpers.toMapAny(accountUpdaterScheduleWithResultRef01DataResult) ?: linkedMapOf()
    assertNotNull(accountUpdaterScheduleWithResultRef01Data, "expected create result to be a map")
    assertNotNull(accountUpdaterScheduleWithResultRef01Data["id"], "expected created entity to have an id")

    // LIST
    val accountUpdaterScheduleWithResultRef01Match = linkedMapOf<String, Any?>()
    accountUpdaterScheduleWithResultRef01Match["account_id"] = setup.idmap!!["account01"]
    accountUpdaterScheduleWithResultRef01Match["schedule_id"] = setup.idmap!!["schedule01"]

    val accountUpdaterScheduleWithResultRef01ListResult = accountUpdaterScheduleWithResultRef01Ent.list(accountUpdaterScheduleWithResultRef01Match, null)
    assertTrue(accountUpdaterScheduleWithResultRef01ListResult is List<*>,
        "expected list result to be an array, got " + accountUpdaterScheduleWithResultRef01ListResult)
    val accountUpdaterScheduleWithResultRef01List = accountUpdaterScheduleWithResultRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(accountUpdaterScheduleWithResultRef01List),
        Struct.jm("id", accountUpdaterScheduleWithResultRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = accountUpdaterScheduleWithResultBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.accountUpdaterScheduleWithResult(null)
    val match = linkedMapOf<String, Any?>()

    // Materialised list result for the same op.
    val listedResult = ent.list(match, null)
    val listed = (listedResult as? List<Any?>) ?: emptyList<Any?>()

    // stream("list") yields items via the streaming feature's iterator.
    val streamed = ent.stream("list", match, null).toList()
    assertTrue(streamed.size > 0, "expected stream to yield items")
    assertEquals(listed.size, streamed.size, "expected stream to match list count")

    // Fallback: with streaming inactive, stream still yields the materialised
    // items.
    val setup2 = accountUpdaterScheduleWithResultBasicSetup(null)
    val ent2 = setup2.client.accountUpdaterScheduleWithResult(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun accountUpdaterScheduleWithResultBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "account_updater_schedule_with_result", "AccountUpdaterScheduleWithResultTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read account_updater_schedule_with_result test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("account_updater_schedule_with_result01")
      idnames.add("account_updater_schedule_with_result02")
      idnames.add("account_updater_schedule_with_result03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      idnames.add("schedule01")
      idnames.add("schedule02")
      idnames.add("schedule03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
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
