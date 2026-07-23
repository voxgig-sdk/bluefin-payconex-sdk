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
class AccountUpdaterUpdateEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.accountUpdaterUpdate(null)
    assertNotNull(ent, "expected non-null account_updater_update entity")
  }

  @Test
  fun basic() {
    val setup = accountUpdaterUpdateBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("load")) {
      val reason = RunnerSupport.skipReason("entityOp", "account_updater_update.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val accountUpdaterUpdateRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.account_updater_update")))
    val accountUpdaterUpdateRef01Data: MutableMap<String, Any?> = if (accountUpdaterUpdateRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(accountUpdaterUpdateRef01DataRaw[0][1]) ?: linkedMapOf())

    // LOAD
    val accountUpdaterUpdateRef01Ent = client.accountUpdaterUpdate(null)
    val accountUpdaterUpdateRef01MatchDt0 = linkedMapOf<String, Any?>()
    accountUpdaterUpdateRef01MatchDt0["id"] = accountUpdaterUpdateRef01Data["id"]
    val accountUpdaterUpdateRef01DataDt0Loaded = accountUpdaterUpdateRef01Ent.load(accountUpdaterUpdateRef01MatchDt0, null)
    val accountUpdaterUpdateRef01DataDt0LoadResult = Helpers.toMapAny(accountUpdaterUpdateRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(accountUpdaterUpdateRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(accountUpdaterUpdateRef01Data["id"], accountUpdaterUpdateRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  companion object {
    fun accountUpdaterUpdateBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "account_updater_update", "AccountUpdaterUpdateTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read account_updater_update test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("account_updater_update01")
      idnames.add("account_updater_update02")
      idnames.add("account_updater_update03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID"])
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
