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
class TransactionDetailEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.transactionDetail(null)
    assertNotNull(ent, "expected non-null transaction_detail entity")
  }

  @Test
  fun basic() {
    val setup = transactionDetailBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("update", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "transaction_detail.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val transactionDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.transaction_detail")))
    val transactionDetailRef01Data: MutableMap<String, Any?> = if (transactionDetailRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(transactionDetailRef01DataRaw[0][1]) ?: linkedMapOf())

    // UPDATE
    val transactionDetailRef01Ent = client.transactionDetail(null)
    val transactionDetailRef01DataUp0Up = linkedMapOf<String, Any?>()
    transactionDetailRef01DataUp0Up["id"] = transactionDetailRef01Data["id"]
    transactionDetailRef01DataUp0Up["account_id"] = setup.idmap!!["account_id"]

    val transactionDetailRef01MarkdefUp0Name = "description"
    val transactionDetailRef01MarkdefUp0Value = "Mark01-transaction_detail_ref01_" + setup.now
    transactionDetailRef01DataUp0Up[transactionDetailRef01MarkdefUp0Name] = transactionDetailRef01MarkdefUp0Value

    val transactionDetailRef01ResdataUp0Result = transactionDetailRef01Ent.update(transactionDetailRef01DataUp0Up, null)
    val transactionDetailRef01ResdataUp0 = Helpers.toMapAny(transactionDetailRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(transactionDetailRef01ResdataUp0, "expected update result to be a map")
    assertEquals(transactionDetailRef01DataUp0Up["id"], transactionDetailRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(transactionDetailRef01MarkdefUp0Value, transactionDetailRef01ResdataUp0[transactionDetailRef01MarkdefUp0Name],
        "expected " + transactionDetailRef01MarkdefUp0Name + " to be updated")

    // LOAD
    val transactionDetailRef01MatchDt0 = linkedMapOf<String, Any?>()
    transactionDetailRef01MatchDt0["id"] = transactionDetailRef01Data["id"]
    val transactionDetailRef01DataDt0Loaded = transactionDetailRef01Ent.load(transactionDetailRef01MatchDt0, null)
    val transactionDetailRef01DataDt0LoadResult = Helpers.toMapAny(transactionDetailRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(transactionDetailRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(transactionDetailRef01Data["id"], transactionDetailRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  companion object {
    fun transactionDetailBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "transaction_detail", "TransactionDetailTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read transaction_detail test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("transaction_detail01")
      idnames.add("transaction_detail02")
      idnames.add("transaction_detail03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      idnames.add("payment01")
      idnames.add("payment02")
      idnames.add("payment03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"])
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
