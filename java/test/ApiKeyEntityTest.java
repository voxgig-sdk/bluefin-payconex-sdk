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
public class ApiKeyEntityTest {

  @Test
  public void instance() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    SdkEntity ent = testsdk.apiKey(null);
    assertNotNull(ent, "expected non-null api_key entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = apiKeyBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "update", "load", "remove" }) {
      String reason = RunnerSupport.skipReason("entityOp", "api_key." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_API_KEY_ENTID JSON to run live");
    BluefinPayconexSDK client = setup.client;

    // CREATE
    SdkEntity apiKeyRef01Ent = client.apiKey(null);
    Map<String, Object> apiKeyRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.api_key"), "api_key_ref01"));
    apiKeyRef01Data.put("account_id", setup.idmap.get("account01"));

    Object apiKeyRef01DataResult = apiKeyRef01Ent.create(apiKeyRef01Data, null);
    apiKeyRef01Data = Helpers.toMapAny(apiKeyRef01DataResult);
    assertNotNull(apiKeyRef01Data, "expected create result to be a map");
    assertNotNull(apiKeyRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> apiKeyRef01Match = new LinkedHashMap<>();
    apiKeyRef01Match.put("account_id", setup.idmap.get("account01"));

    Object apiKeyRef01ListResult = apiKeyRef01Ent.list(apiKeyRef01Match, null);
    assertTrue(apiKeyRef01ListResult instanceof List,
        "expected list result to be an array, got " + apiKeyRef01ListResult);
    List<Object> apiKeyRef01List = (List<Object>) apiKeyRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(apiKeyRef01List),
        Struct.jm("id", apiKeyRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // UPDATE
    Map<String, Object> apiKeyRef01DataUp0Up = new LinkedHashMap<>();
    apiKeyRef01DataUp0Up.put("id", apiKeyRef01Data.get("id"));
    apiKeyRef01DataUp0Up.put("account_id", setup.idmap.get("account_id"));

    String apiKeyRef01MarkdefUp0Name = "expires_at";
    String apiKeyRef01MarkdefUp0Value = "Mark01-api_key_ref01_" + setup.now;
    apiKeyRef01DataUp0Up.put(apiKeyRef01MarkdefUp0Name, apiKeyRef01MarkdefUp0Value);

    Object apiKeyRef01ResdataUp0Result = apiKeyRef01Ent.update(apiKeyRef01DataUp0Up, null);
    Map<String, Object> apiKeyRef01ResdataUp0 = Helpers.toMapAny(apiKeyRef01ResdataUp0Result);
    assertNotNull(apiKeyRef01ResdataUp0, "expected update result to be a map");
    assertEquals(apiKeyRef01DataUp0Up.get("id"), apiKeyRef01ResdataUp0.get("id"),
        "expected update result id to match");
    assertEquals(apiKeyRef01MarkdefUp0Value, apiKeyRef01ResdataUp0.get(apiKeyRef01MarkdefUp0Name),
        "expected " + apiKeyRef01MarkdefUp0Name + " to be updated");

    // LOAD
    Map<String, Object> apiKeyRef01MatchDt0 = new LinkedHashMap<>();
    apiKeyRef01MatchDt0.put("id", apiKeyRef01Data.get("id"));
    Object apiKeyRef01DataDt0Loaded = apiKeyRef01Ent.load(apiKeyRef01MatchDt0, null);
    Map<String, Object> apiKeyRef01DataDt0LoadResult = Helpers.toMapAny(apiKeyRef01DataDt0Loaded);
    assertNotNull(apiKeyRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(apiKeyRef01Data.get("id"), apiKeyRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

    // REMOVE
    Map<String, Object> apiKeyRef01MatchRm0 = new LinkedHashMap<>();
    apiKeyRef01MatchRm0.put("id", apiKeyRef01Data.get("id"));
    apiKeyRef01Ent.remove(apiKeyRef01MatchRm0, null);

    // LIST
    Map<String, Object> apiKeyRef01MatchRt0 = new LinkedHashMap<>();
    apiKeyRef01MatchRt0.put("account_id", setup.idmap.get("account01"));

    Object apiKeyRef01ListRt0Result = apiKeyRef01Ent.list(apiKeyRef01MatchRt0, null);
    assertTrue(apiKeyRef01ListRt0Result instanceof List,
        "expected list result to be an array, got " + apiKeyRef01ListRt0Result);
    List<Object> apiKeyRef01ListRt0 = (List<Object>) apiKeyRef01ListRt0Result;

    List<Object> notFoundItem = Struct.select(
        RunnerSupport.entityListToData(apiKeyRef01ListRt0),
        Struct.jm("id", apiKeyRef01Data.get("id")));
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

    RunnerSupport.EntityTestSetup setup = apiKeyBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.apiKey(null);
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
    RunnerSupport.EntityTestSetup setup2 = apiKeyBasicSetup(null);
    SdkEntity ent2 = setup2.client.apiKey(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup apiKeyBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "api_key", "ApiKeyTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read api_key test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("api_key01");
    idnames.add("api_key02");
    idnames.add("api_key03");
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
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_API_KEY_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINPAYCONEX_TEST_API_KEY_ENTID", idmap);
    envm.put("BLUEFINPAYCONEX_TEST_LIVE", "FALSE");
    envm.put("BLUEFINPAYCONEX_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINPAYCONEX_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINPAYCONEX_TEST_API_KEY_ENTID"));
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
