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
class IframeEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.iframe(null)
    assertNotNull(ent, "expected non-null iframe entity")
  }

  @Test
  fun basic() {
    val setup = iframeBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "update", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "iframe.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_IFRAME_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val iframeRef01Ent = client.iframe(null)
    var iframeRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.iframe"), "iframe_ref01")) ?: linkedMapOf())
    iframeRef01Data["account_id"] = setup.idmap!!["account01"]

    val iframeRef01DataResult = iframeRef01Ent.create(iframeRef01Data, null)
    iframeRef01Data = Helpers.toMapAny(iframeRef01DataResult) ?: linkedMapOf()
    assertNotNull(iframeRef01Data, "expected create result to be a map")
    assertNotNull(iframeRef01Data["id"], "expected created entity to have an id")

    // LIST
    val iframeRef01Match = linkedMapOf<String, Any?>()
    iframeRef01Match["account_id"] = setup.idmap!!["account01"]

    val iframeRef01ListResult = iframeRef01Ent.list(iframeRef01Match, null)
    assertTrue(iframeRef01ListResult is List<*>,
        "expected list result to be an array, got " + iframeRef01ListResult)
    val iframeRef01List = iframeRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(iframeRef01List),
        Struct.jm("id", iframeRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // UPDATE
    val iframeRef01DataUp0Up = linkedMapOf<String, Any?>()
    iframeRef01DataUp0Up["id"] = iframeRef01Data["id"]
    iframeRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val iframeRef01MarkdefUp0Name = "currency"
    val iframeRef01MarkdefUp0Value = "Mark01-iframe_ref01_" + setup.now
    iframeRef01DataUp0Up[iframeRef01MarkdefUp0Name] = iframeRef01MarkdefUp0Value

    val iframeRef01ResdataUp0Result = iframeRef01Ent.update(iframeRef01DataUp0Up, null)
    val iframeRef01ResdataUp0 = Helpers.toMapAny(iframeRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(iframeRef01ResdataUp0, "expected update result to be a map")
    assertEquals(iframeRef01DataUp0Up["id"], iframeRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(iframeRef01MarkdefUp0Value, iframeRef01ResdataUp0[iframeRef01MarkdefUp0Name],
        "expected " + iframeRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val iframeRef01MatchDt0 = linkedMapOf<String, Any?>()
    iframeRef01MatchDt0["id"] = iframeRef01Data["id"]
    val iframeRef01DataDt0Loaded = iframeRef01Ent.load(iframeRef01MatchDt0, null)
    val iframeRef01DataDt0LoadResult = Helpers.toMapAny(iframeRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(iframeRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(iframeRef01Data["id"], iframeRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = iframeBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.iframe(null)
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
    val setup2 = iframeBasicSetup(null)
    val ent2 = setup2.client.iframe(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun iframeBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "iframe", "IframeTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read iframe test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("iframe01")
      idnames.add("iframe02")
      idnames.add("iframe03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      idnames.add("payment_iframe01")
      idnames.add("payment_iframe02")
      idnames.add("payment_iframe03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_IFRAME_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_IFRAME_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_IFRAME_ENTID"])
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
