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
class WebhookEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.webhook(null)
    assertNotNull(ent, "expected non-null webhook entity")
  }

  @Test
  fun basic() {
    val setup = webhookBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "update", "load", "remove")) {
      val reason = RunnerSupport.skipReason("entityOp", "webhook.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val webhookRef01Ent = client.webhook(null)
    var webhookRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.webhook"), "webhook_ref01")) ?: linkedMapOf())
    webhookRef01Data["account_id"] = setup.idmap!!["account01"]

    val webhookRef01DataResult = webhookRef01Ent.create(webhookRef01Data, null)
    webhookRef01Data = Helpers.toMapAny(webhookRef01DataResult) ?: linkedMapOf()
    assertNotNull(webhookRef01Data, "expected create result to be a map")
    assertNotNull(webhookRef01Data["id"], "expected created entity to have an id")

    // LIST
    val webhookRef01Match = linkedMapOf<String, Any?>()
    webhookRef01Match["account_id"] = setup.idmap!!["account01"]

    val webhookRef01ListResult = webhookRef01Ent.list(webhookRef01Match, null)
    assertTrue(webhookRef01ListResult is List<*>,
        "expected list result to be an array, got " + webhookRef01ListResult)
    val webhookRef01List = webhookRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(webhookRef01List),
        Struct.jm("id", webhookRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // UPDATE
    val webhookRef01DataUp0Up = linkedMapOf<String, Any?>()
    webhookRef01DataUp0Up["id"] = webhookRef01Data["id"]
    webhookRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val webhookRef01MarkdefUp0Name = "event"
    val webhookRef01MarkdefUp0Value = "Mark01-webhook_ref01_" + setup.now
    webhookRef01DataUp0Up[webhookRef01MarkdefUp0Name] = webhookRef01MarkdefUp0Value

    val webhookRef01ResdataUp0Result = webhookRef01Ent.update(webhookRef01DataUp0Up, null)
    val webhookRef01ResdataUp0 = Helpers.toMapAny(webhookRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(webhookRef01ResdataUp0, "expected update result to be a map")
    assertEquals(webhookRef01DataUp0Up["id"], webhookRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(webhookRef01MarkdefUp0Value, webhookRef01ResdataUp0[webhookRef01MarkdefUp0Name],
        "expected " + webhookRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val webhookRef01MatchDt0 = linkedMapOf<String, Any?>()
    webhookRef01MatchDt0["id"] = webhookRef01Data["id"]
    val webhookRef01DataDt0Loaded = webhookRef01Ent.load(webhookRef01MatchDt0, null)
    val webhookRef01DataDt0LoadResult = Helpers.toMapAny(webhookRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(webhookRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(webhookRef01Data["id"], webhookRef01DataDt0LoadResult["id"],
        "expected load result id to match")

    // REMOVE
    val webhookRef01MatchRm0 = linkedMapOf<String, Any?>()
    webhookRef01MatchRm0["id"] = webhookRef01Data["id"]
    webhookRef01Ent.remove(webhookRef01MatchRm0, null)

    // LIST
    val webhookRef01MatchRt0 = linkedMapOf<String, Any?>()
    webhookRef01MatchRt0["account_id"] = setup.idmap!!["account01"]

    val webhookRef01ListRt0Result = webhookRef01Ent.list(webhookRef01MatchRt0, null)
    assertTrue(webhookRef01ListRt0Result is List<*>,
        "expected list result to be an array, got " + webhookRef01ListRt0Result)
    val webhookRef01ListRt0 = webhookRef01ListRt0Result as List<Any?>

    val notFoundItem = Struct.select(
        RunnerSupport.entityListToData(webhookRef01ListRt0),
        Struct.jm("id", webhookRef01Data["id"]))
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = webhookBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.webhook(null)
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
    val setup2 = webhookBasicSetup(null)
    val ent2 = setup2.client.webhook(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun webhookBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "webhook", "WebhookTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read webhook test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("webhook01")
      idnames.add("webhook02")
      idnames.add("webhook03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"])
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
