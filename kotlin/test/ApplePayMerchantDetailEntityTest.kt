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
class ApplePayMerchantDetailEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinPayconexSDK.testSDK()
    val ent = testsdk.applePayMerchantDetail(null)
    assertNotNull(ent, "expected non-null apple_pay_merchant_detail entity")
  }

  @Test
  fun basic() {
    val setup = applePayMerchantDetailBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list")) {
      val reason = RunnerSupport.skipReason("entityOp", "apple_pay_merchant_detail.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val applePayMerchantDetailRef01Ent = client.applePayMerchantDetail(null)
    var applePayMerchantDetailRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.apple_pay_merchant_detail"), "apple_pay_merchant_detail_ref01")) ?: linkedMapOf())
    applePayMerchantDetailRef01Data["account_id"] = setup.idmap!!["account01"]

    val applePayMerchantDetailRef01DataResult = applePayMerchantDetailRef01Ent.create(applePayMerchantDetailRef01Data, null)
    applePayMerchantDetailRef01Data = Helpers.toMapAny(applePayMerchantDetailRef01DataResult) ?: linkedMapOf()
    assertNotNull(applePayMerchantDetailRef01Data, "expected create result to be a map")

    // LIST
    val applePayMerchantDetailRef01Match = linkedMapOf<String, Any?>()
    applePayMerchantDetailRef01Match["account_id"] = setup.idmap!!["account01"]

    val applePayMerchantDetailRef01ListResult = applePayMerchantDetailRef01Ent.list(applePayMerchantDetailRef01Match, null)
    assertTrue(applePayMerchantDetailRef01ListResult is List<*>,
        "expected list result to be an array, got " + applePayMerchantDetailRef01ListResult)
    val applePayMerchantDetailRef01List = applePayMerchantDetailRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(applePayMerchantDetailRef01List),
        Struct.jm("id", applePayMerchantDetailRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = applePayMerchantDetailBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.applePayMerchantDetail(null)
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
    val setup2 = applePayMerchantDetailBasicSetup(null)
    val ent2 = setup2.client.applePayMerchantDetail(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun applePayMerchantDetailBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "apple_pay_merchant_detail", "ApplePayMerchantDetailTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read apple_pay_merchant_detail test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinPayconexSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("apple_pay_merchant_detail01")
      idnames.add("apple_pay_merchant_detail02")
      idnames.add("apple_pay_merchant_detail03")
      idnames.add("account01")
      idnames.add("account02")
      idnames.add("account03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"] = idmap
      envm["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE"
      envm["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINPAYCONEX_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"])
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
