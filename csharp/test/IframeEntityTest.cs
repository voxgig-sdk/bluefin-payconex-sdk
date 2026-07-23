// iframe entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class IframeEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.Iframe();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = IframeBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "update", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "iframe." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_IFRAME_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var iframeRef01Ent = client.Iframe();
        var iframeRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "iframe")),
            "iframe_ref01"));
        iframeRef01Data!["account_id"] = setup.Idmap["account01"];

        var iframeRef01DataResult = iframeRef01Ent.Create(iframeRef01Data, null);
        iframeRef01Data = Helpers.ToMapAny(iframeRef01DataResult);
        Assert.True(iframeRef01Data != null, "expected create result to be a map");
        Assert.True(iframeRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var iframeRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var iframeRef01ListResult = iframeRef01Ent.List(iframeRef01Match, null);
        var iframeRef01List = iframeRef01ListResult as List<object?>;
        Assert.True(iframeRef01List != null,
            $"expected list result to be a list, got {iframeRef01ListResult?.GetType()}");

        var iframeRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(iframeRef01List!),
            new Dictionary<string, object?> { ["id"] = iframeRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(iframeRef01ListFound),
            "expected to find created entity in list");

        // UPDATE
        var iframeRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = iframeRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var iframeRef01MarkdefUp0Name = "currency";
        var iframeRef01MarkdefUp0Value = $"Mark01-iframe_ref01_{setup.Now}";
        iframeRef01DataUp0Up[iframeRef01MarkdefUp0Name] = iframeRef01MarkdefUp0Value;

        var iframeRef01ResdataUp0Result = iframeRef01Ent.Update(iframeRef01DataUp0Up, null);
        var iframeRef01ResdataUp0 = Helpers.ToMapAny(iframeRef01ResdataUp0Result);
        Assert.True(iframeRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(iframeRef01ResdataUp0!["id"], iframeRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(iframeRef01ResdataUp0![iframeRef01MarkdefUp0Name], iframeRef01MarkdefUp0Value),
            $"expected {iframeRef01MarkdefUp0Name} to be updated, got {iframeRef01ResdataUp0[iframeRef01MarkdefUp0Name]}");

        // LOAD
        var iframeRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = iframeRef01Data!["id"],
        };
        var iframeRef01DataDt0Loaded = iframeRef01Ent.Load(iframeRef01MatchDt0, null);
        var iframeRef01DataDt0LoadResult = Helpers.ToMapAny(iframeRef01DataDt0Loaded);
        Assert.True(iframeRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(iframeRef01DataDt0LoadResult!["id"], iframeRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = IframeBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.Iframe();
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
        var setup2 = IframeBasicSetup(null);
        var ent2 = setup2.Client.Iframe();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup IframeBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "iframe",
            "IframeTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse iframe test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "iframe01", "iframe02", "iframe03", "account01", "account02", "account03", "payment_iframe01", "payment_iframe02", "payment_iframe03" },
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
            "BLUEFINPAYCONEX_TEST_IFRAME_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_IFRAME_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_IFRAME_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        // Add account_id alias for the update test.
        if (StructUtils.GetProp(idmapResolved, "account_id") == null)
        {
            idmapResolved["account_id"] = StructUtils.GetProp(idmapResolved, "account01");
        }

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
