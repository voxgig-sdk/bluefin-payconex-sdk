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
class ApiKeyEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.apiKey(null)
    assertNotNull(ent, "expected non-null api_key entity")
  }

  @Test
  fun basic() {
    val setup = apiKeyBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "update", "load", "remove")) {
      val reason = RunnerSupport.skipReason("entityOp", "api_key.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_API_KEY_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val apiKeyRef01Ent = client.apiKey(null)
    var apiKeyRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.api_key"), "api_key_ref01")) ?: linkedMapOf())
    apiKeyRef01Data["account_id"] = setup.idmap!!["account01"]

    val apiKeyRef01DataResult = apiKeyRef01Ent.create(apiKeyRef01Data, null)
    apiKeyRef01Data = Helpers.toMapAny(apiKeyRef01DataResult) ?: linkedMapOf()
    assertNotNull(apiKeyRef01Data, "expected create result to be a map")
    assertNotNull(apiKeyRef01Data["id"], "expected created entity to have an id")

    // LIST
    val apiKeyRef01Match = linkedMapOf<String, Any?>()
    apiKeyRef01Match["account_id"] = setup.idmap!!["account01"]

    val apiKeyRef01ListResult = apiKeyRef01Ent.list(apiKeyRef01Match, null)
    assertTrue(apiKeyRef01ListResult is List<*>,
        "expected list result to be an array, got " + apiKeyRef01ListResult)
    val apiKeyRef01List = apiKeyRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(apiKeyRef01List),
        Struct.jm("id", apiKeyRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // UPDATE
    val apiKeyRef01DataUp0Up = linkedMapOf<String, Any?>()
    apiKeyRef01DataUp0Up["id"] = apiKeyRef01Data["id"]
    apiKeyRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val apiKeyRef01MarkdefUp0Name = "expires_at"
    val apiKeyRef01MarkdefUp0Value = "Mark01-api_key_ref01_" + setup.now
    apiKeyRef01DataUp0Up[apiKeyRef01MarkdefUp0Name] = apiKeyRef01MarkdefUp0Value

    val apiKeyRef01ResdataUp0Result = apiKeyRef01Ent.update(apiKeyRef01DataUp0Up, null)
    val apiKeyRef01ResdataUp0 = Helpers.toMapAny(apiKeyRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(apiKeyRef01ResdataUp0, "expected update result to be a map")
    assertEquals(apiKeyRef01DataUp0Up["id"], apiKeyRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(apiKeyRef01MarkdefUp0Value, apiKeyRef01ResdataUp0[apiKeyRef01MarkdefUp0Name],
        "expected " + apiKeyRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val apiKeyRef01MatchDt0 = linkedMapOf<String, Any?>()
    apiKeyRef01MatchDt0["id"] = apiKeyRef01Data["id"]
    val apiKeyRef01DataDt0Loaded = apiKeyRef01Ent.load(apiKeyRef01MatchDt0, null)
    val apiKeyRef01DataDt0LoadResult = Helpers.toMapAny(apiKeyRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(apiKeyRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(apiKeyRef01Data["id"], apiKeyRef01DataDt0LoadResult["id"],
        "expected load result id to match")

    // REMOVE
    val apiKeyRef01MatchRm0 = linkedMapOf<String, Any?>()
    apiKeyRef01MatchRm0["id"] = apiKeyRef01Data["id"]
    apiKeyRef01Ent.remove(apiKeyRef01MatchRm0, null)

    // LIST
    val apiKeyRef01MatchRt0 = linkedMapOf<String, Any?>()
    apiKeyRef01MatchRt0["account_id"] = setup.idmap!!["account01"]

    val apiKeyRef01ListRt0Result = apiKeyRef01Ent.list(apiKeyRef01MatchRt0, null)
    assertTrue(apiKeyRef01ListRt0Result is List<*>,
        "expected list result to be an array, got " + apiKeyRef01ListRt0Result)
    val apiKeyRef01ListRt0 = apiKeyRef01ListRt0Result as List<Any?>

    val notFoundItem = Struct.select(
        RunnerSupport.entityListToData(apiKeyRef01ListRt0),
        Struct.jm("id", apiKeyRef01Data["id"]))
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = apiKeyBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.apiKey(null)
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
    val setup2 = apiKeyBasicSetup(null)
    val ent2 = setup2.client.apiKey(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun apiKeyBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "api_key", "ApiKeyTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read api_key test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("api_key01")
      idnames.add("api_key02")
      idnames.add("api_key03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_API_KEY_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"])
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
