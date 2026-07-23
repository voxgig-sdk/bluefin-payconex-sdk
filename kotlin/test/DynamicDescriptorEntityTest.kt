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
class DynamicDescriptorEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.dynamicDescriptor(null)
    assertNotNull(ent, "expected non-null dynamic_descriptor entity")
  }

  @Test
  fun basic() {
    val setup = dynamicDescriptorBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "update", "load", "remove")) {
      val reason = RunnerSupport.skipReason("entityOp", "dynamic_descriptor.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val dynamicDescriptorRef01Ent = client.dynamicDescriptor(null)
    var dynamicDescriptorRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.dynamic_descriptor"), "dynamic_descriptor_ref01")) ?: linkedMapOf())
    dynamicDescriptorRef01Data["account_id"] = setup.idmap!!["account01"]

    val dynamicDescriptorRef01DataResult = dynamicDescriptorRef01Ent.create(dynamicDescriptorRef01Data, null)
    dynamicDescriptorRef01Data = Helpers.toMapAny(dynamicDescriptorRef01DataResult) ?: linkedMapOf()
    assertNotNull(dynamicDescriptorRef01Data, "expected create result to be a map")
    assertNotNull(dynamicDescriptorRef01Data["id"], "expected created entity to have an id")

    // LIST
    val dynamicDescriptorRef01Match = linkedMapOf<String, Any?>()
    dynamicDescriptorRef01Match["account_id"] = setup.idmap!!["account01"]

    val dynamicDescriptorRef01ListResult = dynamicDescriptorRef01Ent.list(dynamicDescriptorRef01Match, null)
    assertTrue(dynamicDescriptorRef01ListResult is List<*>,
        "expected list result to be an array, got " + dynamicDescriptorRef01ListResult)
    val dynamicDescriptorRef01List = dynamicDescriptorRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(dynamicDescriptorRef01List),
        Struct.jm("id", dynamicDescriptorRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // UPDATE
    val dynamicDescriptorRef01DataUp0Up = linkedMapOf<String, Any?>()
    dynamicDescriptorRef01DataUp0Up["id"] = dynamicDescriptorRef01Data["id"]
    dynamicDescriptorRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val dynamicDescriptorRef01MarkdefUp0Name = "city"
    val dynamicDescriptorRef01MarkdefUp0Value = "Mark01-dynamic_descriptor_ref01_" + setup.now
    dynamicDescriptorRef01DataUp0Up[dynamicDescriptorRef01MarkdefUp0Name] = dynamicDescriptorRef01MarkdefUp0Value

    val dynamicDescriptorRef01ResdataUp0Result = dynamicDescriptorRef01Ent.update(dynamicDescriptorRef01DataUp0Up, null)
    val dynamicDescriptorRef01ResdataUp0 = Helpers.toMapAny(dynamicDescriptorRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(dynamicDescriptorRef01ResdataUp0, "expected update result to be a map")
    assertEquals(dynamicDescriptorRef01DataUp0Up["id"], dynamicDescriptorRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(dynamicDescriptorRef01MarkdefUp0Value, dynamicDescriptorRef01ResdataUp0[dynamicDescriptorRef01MarkdefUp0Name],
        "expected " + dynamicDescriptorRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val dynamicDescriptorRef01MatchDt0 = linkedMapOf<String, Any?>()
    dynamicDescriptorRef01MatchDt0["id"] = dynamicDescriptorRef01Data["id"]
    val dynamicDescriptorRef01DataDt0Loaded = dynamicDescriptorRef01Ent.load(dynamicDescriptorRef01MatchDt0, null)
    val dynamicDescriptorRef01DataDt0LoadResult = Helpers.toMapAny(dynamicDescriptorRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(dynamicDescriptorRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(dynamicDescriptorRef01Data["id"], dynamicDescriptorRef01DataDt0LoadResult["id"],
        "expected load result id to match")

    // REMOVE
    val dynamicDescriptorRef01MatchRm0 = linkedMapOf<String, Any?>()
    dynamicDescriptorRef01MatchRm0["id"] = dynamicDescriptorRef01Data["id"]
    dynamicDescriptorRef01Ent.remove(dynamicDescriptorRef01MatchRm0, null)

    // LIST
    val dynamicDescriptorRef01MatchRt0 = linkedMapOf<String, Any?>()
    dynamicDescriptorRef01MatchRt0["account_id"] = setup.idmap!!["account01"]

    val dynamicDescriptorRef01ListRt0Result = dynamicDescriptorRef01Ent.list(dynamicDescriptorRef01MatchRt0, null)
    assertTrue(dynamicDescriptorRef01ListRt0Result is List<*>,
        "expected list result to be an array, got " + dynamicDescriptorRef01ListRt0Result)
    val dynamicDescriptorRef01ListRt0 = dynamicDescriptorRef01ListRt0Result as List<Any?>

    val notFoundItem = Struct.select(
        RunnerSupport.entityListToData(dynamicDescriptorRef01ListRt0),
        Struct.jm("id", dynamicDescriptorRef01Data["id"]))
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = dynamicDescriptorBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.dynamicDescriptor(null)
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
    val setup2 = dynamicDescriptorBasicSetup(null)
    val ent2 = setup2.client.dynamicDescriptor(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun dynamicDescriptorBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "dynamic_descriptor", "DynamicDescriptorTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read dynamic_descriptor test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("dynamic_descriptor01")
      idnames.add("dynamic_descriptor02")
      idnames.add("dynamic_descriptor03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"])
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
