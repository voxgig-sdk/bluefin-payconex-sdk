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
class ListApiKeyScopesEntryEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.listApiKeyScopesEntry(null)
    assertNotNull(ent, "expected non-null list_api_key_scopes_entry entity")
  }

  @Test
  fun basic() {
    val setup = listApiKeyScopesEntryBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("list")) {
      val reason = RunnerSupport.skipReason("entityOp", "list_api_key_scopes_entry.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val listApiKeyScopesEntryRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.list_api_key_scopes_entry")))
    val listApiKeyScopesEntryRef01Data: MutableMap<String, Any?> = if (listApiKeyScopesEntryRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(listApiKeyScopesEntryRef01DataRaw[0][1]) ?: linkedMapOf())

    // LIST
    val listApiKeyScopesEntryRef01Ent = client.listApiKeyScopesEntry(null)
    val listApiKeyScopesEntryRef01Match = linkedMapOf<String, Any?>()

    val listApiKeyScopesEntryRef01ListResult = listApiKeyScopesEntryRef01Ent.list(listApiKeyScopesEntryRef01Match, null)
    assertTrue(listApiKeyScopesEntryRef01ListResult is List<*>,
        "expected list result to be an array, got " + listApiKeyScopesEntryRef01ListResult)

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = listApiKeyScopesEntryBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.listApiKeyScopesEntry(null)
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
    val setup2 = listApiKeyScopesEntryBasicSetup(null)
    val ent2 = setup2.client.listApiKeyScopesEntry(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun listApiKeyScopesEntryBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "list_api_key_scopes_entry", "ListApiKeyScopesEntryTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read list_api_key_scopes_entry test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("list_api_key_scopes_entry01")
      idnames.add("list_api_key_scopes_entry02")
      idnames.add("list_api_key_scopes_entry03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID"])
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
