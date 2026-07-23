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
public class WebhookEntityTest {

  @Test
  public void instance() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    SdkEntity ent = testsdk.webhook(null);
    assertNotNull(ent, "expected non-null webhook entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = webhookBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "update", "load", "remove" }) {
      String reason = RunnerSupport.skipReason("entityOp", "webhook." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID JSON to run live");
    BluefinPayconexSDK client = setup.client;

    // CREATE
    SdkEntity webhookRef01Ent = client.webhook(null);
    Map<String, Object> webhookRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.webhook"), "webhook_ref01"));
    webhookRef01Data.put("account_id", setup.idmap.get("account01"));

    Object webhookRef01DataResult = webhookRef01Ent.create(webhookRef01Data, null);
    webhookRef01Data = Helpers.toMapAny(webhookRef01DataResult);
    assertNotNull(webhookRef01Data, "expected create result to be a map");
    assertNotNull(webhookRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> webhookRef01Match = new LinkedHashMap<>();
    webhookRef01Match.put("account_id", setup.idmap.get("account01"));

    Object webhookRef01ListResult = webhookRef01Ent.list(webhookRef01Match, null);
    assertTrue(webhookRef01ListResult instanceof List,
        "expected list result to be an array, got " + webhookRef01ListResult);
    List<Object> webhookRef01List = (List<Object>) webhookRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(webhookRef01List),
        Struct.jm("id", webhookRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // UPDATE
    Map<String, Object> webhookRef01DataUp0Up = new LinkedHashMap<>();
    webhookRef01DataUp0Up.put("id", webhookRef01Data.get("id"));
    webhookRef01DataUp0Up.put("account_id", setup.idmap.get("account_id"));

    String webhookRef01MarkdefUp0Name = "event";
    String webhookRef01MarkdefUp0Value = "Mark01-webhook_ref01_" + setup.now;
    webhookRef01DataUp0Up.put(webhookRef01MarkdefUp0Name, webhookRef01MarkdefUp0Value);

    Object webhookRef01ResdataUp0Result = webhookRef01Ent.update(webhookRef01DataUp0Up, null);
    Map<String, Object> webhookRef01ResdataUp0 = Helpers.toMapAny(webhookRef01ResdataUp0Result);
    assertNotNull(webhookRef01ResdataUp0, "expected update result to be a map");
    assertEquals(webhookRef01DataUp0Up.get("id"), webhookRef01ResdataUp0.get("id"),
        "expected update result id to match");
    assertEquals(webhookRef01MarkdefUp0Value, webhookRef01ResdataUp0.get(webhookRef01MarkdefUp0Name),
        "expected " + webhookRef01MarkdefUp0Name + " to be updated");

    // LOAD
    Map<String, Object> webhookRef01MatchDt0 = new LinkedHashMap<>();
    webhookRef01MatchDt0.put("id", webhookRef01Data.get("id"));
    Object webhookRef01DataDt0Loaded = webhookRef01Ent.load(webhookRef01MatchDt0, null);
    Map<String, Object> webhookRef01DataDt0LoadResult = Helpers.toMapAny(webhookRef01DataDt0Loaded);
    assertNotNull(webhookRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(webhookRef01Data.get("id"), webhookRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

    // REMOVE
    Map<String, Object> webhookRef01MatchRm0 = new LinkedHashMap<>();
    webhookRef01MatchRm0.put("id", webhookRef01Data.get("id"));
    webhookRef01Ent.remove(webhookRef01MatchRm0, null);

    // LIST
    Map<String, Object> webhookRef01MatchRt0 = new LinkedHashMap<>();
    webhookRef01MatchRt0.put("account_id", setup.idmap.get("account01"));

    Object webhookRef01ListRt0Result = webhookRef01Ent.list(webhookRef01MatchRt0, null);
    assertTrue(webhookRef01ListRt0Result instanceof List,
        "expected list result to be an array, got " + webhookRef01ListRt0Result);
    List<Object> webhookRef01ListRt0 = (List<Object>) webhookRef01ListRt0Result;

    List<Object> notFoundItem = Struct.select(
        RunnerSupport.entityListToData(webhookRef01ListRt0),
        Struct.jm("id", webhookRef01Data.get("id")));
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list");

  }

  @Test
  public void stream() {
    Map<String, Object> streamingActive = new LinkedHashMap<>();
    Map<String, Object> streamingOpts = new LinkedHashMap<>();
    streamingOpts.put("active", true);
    Map<String, Object> featureOpts = new LinkedHashMap<>();
    featureOpts.put("streaming", streamingOpts);
    streamingActive.put("feature", featureOpts);

    RunnerSupport.EntityTestSetup setup = webhookBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.webhook(null);
    Map<String, Object> match = new LinkedHashMap<>();

    // Materialised list result for the same op.
    Object listedResult = ent.list(match, null);
    List<Object> listed = listedResult instanceof List
        ? (List<Object>) listedResult : new ArrayList<>();

    // stream("list") yields items via the streaming feature's iterator.
    List<Object> streamed = ent.stream("list", match, null)
        .collect(Collectors.toList());
    assertTrue(streamed.size() > 0, "expected stream to yield items");
    assertEquals(listed.size(), streamed.size(),
        "expected stream to yield the same item count as list");

    // Fallback: with streaming inactive, stream still yields the
    // materialised items.
    RunnerSupport.EntityTestSetup setup2 = webhookBasicSetup(null);
    SdkEntity ent2 = setup2.client.webhook(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup webhookBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "webhook", "WebhookTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read webhook test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("webhook01");
    idnames.add("webhook02");
    idnames.add("webhook03");
    idnames.add("account01");
    idnames.add("account02");
    idnames.add("account03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID", idmap);
    envm.put("BLUEFINPAYCONEX_TEST_LIVE", "FALSE");
    envm.put("BLUEFINPAYCONEX_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINPAYCONEX_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"));
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
