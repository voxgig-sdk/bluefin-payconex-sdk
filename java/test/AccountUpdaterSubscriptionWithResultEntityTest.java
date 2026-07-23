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
public class AccountUpdaterSubscriptionWithResultEntityTest {

  @Test
  public void instance() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    SdkEntity ent = testsdk.accountUpdaterSubscriptionWithResult(null);
    assertNotNull(ent, "expected non-null account_updater_subscription_with_result entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = accountUpdaterSubscriptionWithResultBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "update", "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "account_updater_subscription_with_result." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live");
    BluefinPayconexSDK client = setup.client;

    // CREATE
    SdkEntity accountUpdaterSubscriptionWithResultRef01Ent = client.accountUpdaterSubscriptionWithResult(null);
    Map<String, Object> accountUpdaterSubscriptionWithResultRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01"));
    accountUpdaterSubscriptionWithResultRef01Data.put("account_id", setup.idmap.get("account01"));
    accountUpdaterSubscriptionWithResultRef01Data.put("subscription_id", setup.idmap.get("subscription01"));

    Object accountUpdaterSubscriptionWithResultRef01DataResult = accountUpdaterSubscriptionWithResultRef01Ent.create(accountUpdaterSubscriptionWithResultRef01Data, null);
    accountUpdaterSubscriptionWithResultRef01Data = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataResult);
    assertNotNull(accountUpdaterSubscriptionWithResultRef01Data, "expected create result to be a map");
    assertNotNull(accountUpdaterSubscriptionWithResultRef01Data.get("id"), "expected created entity to have an id");

    // UPDATE
    Map<String, Object> accountUpdaterSubscriptionWithResultRef01DataUp0Up = new LinkedHashMap<>();
    accountUpdaterSubscriptionWithResultRef01DataUp0Up.put("id", accountUpdaterSubscriptionWithResultRef01Data.get("id"));
    accountUpdaterSubscriptionWithResultRef01DataUp0Up.put("account_id", setup.idmap.get("account_id"));

    String accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name = "created_at";
    String accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value = "Mark01-account_updater_subscription_with_result_ref01_" + setup.now;
    accountUpdaterSubscriptionWithResultRef01DataUp0Up.put(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name, accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value);

    Object accountUpdaterSubscriptionWithResultRef01ResdataUp0Result = accountUpdaterSubscriptionWithResultRef01Ent.update(accountUpdaterSubscriptionWithResultRef01DataUp0Up, null);
    Map<String, Object> accountUpdaterSubscriptionWithResultRef01ResdataUp0 = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01ResdataUp0Result);
    assertNotNull(accountUpdaterSubscriptionWithResultRef01ResdataUp0, "expected update result to be a map");
    assertEquals(accountUpdaterSubscriptionWithResultRef01DataUp0Up.get("id"), accountUpdaterSubscriptionWithResultRef01ResdataUp0.get("id"),
        "expected update result id to match");
    assertEquals(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value, accountUpdaterSubscriptionWithResultRef01ResdataUp0.get(accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name),
        "expected " + accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name + " to be updated");

    // LOAD
    Map<String, Object> accountUpdaterSubscriptionWithResultRef01MatchDt0 = new LinkedHashMap<>();
    accountUpdaterSubscriptionWithResultRef01MatchDt0.put("id", accountUpdaterSubscriptionWithResultRef01Data.get("id"));
    Object accountUpdaterSubscriptionWithResultRef01DataDt0Loaded = accountUpdaterSubscriptionWithResultRef01Ent.load(accountUpdaterSubscriptionWithResultRef01MatchDt0, null);
    Map<String, Object> accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult = Helpers.toMapAny(accountUpdaterSubscriptionWithResultRef01DataDt0Loaded);
    assertNotNull(accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(accountUpdaterSubscriptionWithResultRef01Data.get("id"), accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

  }

  static RunnerSupport.EntityTestSetup accountUpdaterSubscriptionWithResultBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "account_updater_subscription_with_result", "AccountUpdaterSubscriptionWithResultTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read account_updater_subscription_with_result test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("account_updater_subscription_with_result01");
    idnames.add("account_updater_subscription_with_result02");
    idnames.add("account_updater_subscription_with_result03");
    idnames.add("account01");
    idnames.add("account02");
    idnames.add("account03");
    idnames.add("subscription01");
    idnames.add("subscription02");
    idnames.add("subscription03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID", idmap);
    envm.put("BLUEFINPAYCONEX_TEST_LIVE", "FALSE");
    envm.put("BLUEFINPAYCONEX_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINPAYCONEX_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"));
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
