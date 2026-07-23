// apple_pay_merchant_detail entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class ApplePayMerchantDetailEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.ApplePayMerchantDetail();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = ApplePayMerchantDetailBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "apple_pay_merchant_detail." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var applePayMerchantDetailRef01Ent = client.ApplePayMerchantDetail();
        var applePayMerchantDetailRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "apple_pay_merchant_detail")),
            "apple_pay_merchant_detail_ref01"));
        applePayMerchantDetailRef01Data!["account_id"] = setup.Idmap["account01"];

        var applePayMerchantDetailRef01DataResult = applePayMerchantDetailRef01Ent.Create(applePayMerchantDetailRef01Data, null);
        applePayMerchantDetailRef01Data = Helpers.ToMapAny(applePayMerchantDetailRef01DataResult);
        Assert.True(applePayMerchantDetailRef01Data != null, "expected create result to be a map");

        // LIST
        var applePayMerchantDetailRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var applePayMerchantDetailRef01ListResult = applePayMerchantDetailRef01Ent.List(applePayMerchantDetailRef01Match, null);
        var applePayMerchantDetailRef01List = applePayMerchantDetailRef01ListResult as List<object?>;
        Assert.True(applePayMerchantDetailRef01List != null,
            $"expected list result to be a list, got {applePayMerchantDetailRef01ListResult?.GetType()}");

        var applePayMerchantDetailRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(applePayMerchantDetailRef01List!),
            new Dictionary<string, object?> { ["id"] = applePayMerchantDetailRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(applePayMerchantDetailRef01ListFound),
            "expected to find created entity in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = ApplePayMerchantDetailBasicSetup(new Dictionary<string, object?>
        {
            ["feature"] = new Dictionary<string, object?>
            {
                ["streaming"] = new Dictionary<string, object?> { ["active"] = true },
            },
        });
        if (setup.Live)
        {
            return; // unit mode only - streams the seeded fixture data
        }

        var ent = setup.Client.ApplePayMerchantDetail();
        var match = new Dictionary<string, object?>();

        // Materialised list result for the same op.
        var listed = ent.List(match, null) as List<object?> ?? new List<object?>();

        // stream("list") yields items via the streaming feature's iterator.
        var streamed = new List<object?>();
        await foreach (var item in ent.Stream("list", match, null))
        {
            streamed.Add(item);
        }
        Assert.True(streamed.Count > 0, "expected stream to yield items");
        Assert.Equal(listed.Count, streamed.Count);

        // Fallback: with streaming inactive, stream still yields the
        // materialised items.
        var setup2 = ApplePayMerchantDetailBasicSetup(null);
        var ent2 = setup2.Client.ApplePayMerchantDetail();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup ApplePayMerchantDetailBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "apple_pay_merchant_detail",
            "ApplePayMerchantDetailTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse apple_pay_merchant_detail test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "apple_pay_merchant_detail01", "apple_pay_merchant_detail02", "apple_pay_merchant_detail03", "account01", "account02", "account03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFINPAYCONEX_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFINPAYCONEX_APIKEY"],
                },
                extra,
            });
            client = new BluefinPayconexSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFINPAYCONEX_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFINPAYCONEX_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}
