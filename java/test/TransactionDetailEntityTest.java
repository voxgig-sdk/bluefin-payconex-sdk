package voxgig.bluefinpayconexsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefinpayconexsdk.core.Helpers;
import voxgig.bluefinpayconexsdk.core.SdkEntity;
import voxgig.bluefinpayconexsdk.core.BluefinPayconexSDK;
import voxgig.bluefinpayconexsdk.utility.Json;
import voxgig.bluefinpayconexsdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class TransactionDetailEntityTest {

  @Test
  public void instance() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    SdkEntity ent = testsdk.transactionDetail(null);
    assertNotNull(ent, "expected non-null transaction_detail entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = transactionDetailBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "update", "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "transaction_detail." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live");
    BluefinPayconexSDK client = setup.client;

    // Bootstrap entity data from existing test data (no create step in flow).
    List<List<Object>> transactionDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.transaction_detail")));
    Map<String, Object> transactionDetailRef01Data = transactionDetailRef01DataRaw.isEmpty()
        ? null : Helpers.toMapAny(transactionDetailRef01DataRaw.get(0).get(1));

    // UPDATE
    SdkEntity transactionDetailRef01Ent = client.transactionDetail(null);
    Map<String, Object> transactionDetailRef01DataUp0Up = new LinkedHashMap<>();
    transactionDetailRef01DataUp0Up.put("id", transactionDetailRef01Data.get("id"));
    transactionDetailRef01DataUp0Up.put("account_id", setup.idmap.get("account_id"));

    String transactionDetailRef01MarkdefUp0Name = "description";
    String transactionDetailRef01MarkdefUp0Value = "Mark01-transaction_detail_ref01_" + setup.now;
    transactionDetailRef01DataUp0Up.put(transactionDetailRef01MarkdefUp0Name, transactionDetailRef01MarkdefUp0Value);

    Object transactionDetailRef01ResdataUp0Result = transactionDetailRef01Ent.update(transactionDetailRef01DataUp0Up, null);
    Map<String, Object> transactionDetailRef01ResdataUp0 = Helpers.toMapAny(transactionDetailRef01ResdataUp0Result);
    assertNotNull(transactionDetailRef01ResdataUp0, "expected update result to be a map");
    assertEquals(transactionDetailRef01DataUp0Up.get("id"), transactionDetailRef01ResdataUp0.get("id"),
        "expected update result id to match");
    assertEquals(transactionDetailRef01MarkdefUp0Value, transactionDetailRef01ResdataUp0.get(transactionDetailRef01MarkdefUp0Name),
        "expected " + transactionDetailRef01MarkdefUp0Name + " to be updated");

    // LOAD
    Map<String, Object> transactionDetailRef01MatchDt0 = new LinkedHashMap<>();
    transactionDetailRef01MatchDt0.put("id", transactionDetailRef01Data.get("id"));
    Object transactionDetailRef01DataDt0Loaded = transactionDetailRef01Ent.load(transactionDetailRef01MatchDt0, null);
    Map<String, Object> transactionDetailRef01DataDt0LoadResult = Helpers.toMapAny(transactionDetailRef01DataDt0Loaded);
    assertNotNull(transactionDetailRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(transactionDetailRef01Data.get("id"), transactionDetailRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

  }

  static RunnerSupport.EntityTestSetup transactionDetailBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "transaction_detail", "TransactionDetailTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read transaction_detail test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("transaction_detail01");
    idnames.add("transaction_detail02");
    idnames.add("transaction_detail03");
    idnames.add("account01");
    idnames.add("account02");
    idnames.add("account03");
    idnames.add("payment01");
    idnames.add("payment02");
    idnames.add("payment03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID", idmap);
    envm.put("BLUEFINPAYCONEX_TEST_LIVE", "FALSE");
    envm.put("BLUEFINPAYCONEX_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINPAYCONEX_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }
    // Add account_id alias for update test.
    if (idmapResolved.get("account_id") == null) {
      idmapResolved.put("account_id", idmapResolved.get("account01"));
    }

    boolean live = "TRUE".equals(env.get("BLUEFINPAYCONEX_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFINPAYCONEX_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinPayconexSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINPAYCONEX_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}
