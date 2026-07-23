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
public class PaymentIframeEntityTest {

  @Test
  public void instance() {
    BluefinPayconexSDK testsdk = BluefinPayconexSDK.testSDK();
    SdkEntity ent = testsdk.paymentIframe(null);
    assertNotNull(ent, "expected non-null payment_iframe entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = paymentIframeBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] {  }) {
      String reason = RunnerSupport.skipReason("entityOp", "payment_iframe." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_PAYMENT_IFRAME_ENTID JSON to run live");
    // Bootstrap entity data from existing test data (no create step in flow).
    List<List<Object>> paymentIframeRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.payment_iframe")));
    Map<String, Object> paymentIframeRef01Data = paymentIframeRef01DataRaw.isEmpty()
        ? null : Helpers.toMapAny(paymentIframeRef01DataRaw.get(0).get(1));

  }

  static RunnerSupport.EntityTestSetup paymentIframeBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "payment_iframe", "PaymentIframeTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read payment_iframe test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("payment_iframe01");
    idnames.add("payment_iframe02");
    idnames.add("payment_iframe03");
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
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINPAYCONEX_TEST_PAYMENT_IFRAME_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINPAYCONEX_TEST_PAYMENT_IFRAME_ENTID", idmap);
    envm.put("BLUEFINPAYCONEX_TEST_LIVE", "FALSE");
    envm.put("BLUEFINPAYCONEX_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINPAYCONEX_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINPAYCONEX_TEST_PAYMENT_IFRAME_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
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
