// api_key entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class ApiKeyEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.ApiKey();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = ApiKeyBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "update", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "api_key." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_API_KEY_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var apiKeyRef01Ent = client.ApiKey();
        var apiKeyRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "api_key")),
            "api_key_ref01"));
        apiKeyRef01Data!["account_id"] = setup.Idmap["account01"];

        var apiKeyRef01DataResult = apiKeyRef01Ent.Create(apiKeyRef01Data, null);
        apiKeyRef01Data = Helpers.ToMapAny(apiKeyRef01DataResult);
        Assert.True(apiKeyRef01Data != null, "expected create result to be a map");
        Assert.True(apiKeyRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var apiKeyRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var apiKeyRef01ListResult = apiKeyRef01Ent.List(apiKeyRef01Match, null);
        var apiKeyRef01List = apiKeyRef01ListResult as List<object?>;
        Assert.True(apiKeyRef01List != null,
            $"expected list result to be a list, got {apiKeyRef01ListResult?.GetType()}");

        var apiKeyRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(apiKeyRef01List!),
            new Dictionary<string, object?> { ["id"] = apiKeyRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(apiKeyRef01ListFound),
            "expected to find created entity in list");

        // UPDATE
        var apiKeyRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = apiKeyRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var apiKeyRef01MarkdefUp0Name = "expires_at";
        var apiKeyRef01MarkdefUp0Value = $"Mark01-api_key_ref01_{setup.Now}";
        apiKeyRef01DataUp0Up[apiKeyRef01MarkdefUp0Name] = apiKeyRef01MarkdefUp0Value;

        var apiKeyRef01ResdataUp0Result = apiKeyRef01Ent.Update(apiKeyRef01DataUp0Up, null);
        var apiKeyRef01ResdataUp0 = Helpers.ToMapAny(apiKeyRef01ResdataUp0Result);
        Assert.True(apiKeyRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(apiKeyRef01ResdataUp0!["id"], apiKeyRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(apiKeyRef01ResdataUp0![apiKeyRef01MarkdefUp0Name], apiKeyRef01MarkdefUp0Value),
            $"expected {apiKeyRef01MarkdefUp0Name} to be updated, got {apiKeyRef01ResdataUp0[apiKeyRef01MarkdefUp0Name]}");

        // LOAD
        var apiKeyRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = apiKeyRef01Data!["id"],
        };
        var apiKeyRef01DataDt0Loaded = apiKeyRef01Ent.Load(apiKeyRef01MatchDt0, null);
        var apiKeyRef01DataDt0LoadResult = Helpers.ToMapAny(apiKeyRef01DataDt0Loaded);
        Assert.True(apiKeyRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(apiKeyRef01DataDt0LoadResult!["id"], apiKeyRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var apiKeyRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = apiKeyRef01Data!["id"],
        };
        apiKeyRef01Ent.Remove(apiKeyRef01MatchRm0, null);

        // LIST
        var apiKeyRef01MatchRt0 = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var apiKeyRef01ListRt0Result = apiKeyRef01Ent.List(apiKeyRef01MatchRt0, null);
        var apiKeyRef01ListRt0 = apiKeyRef01ListRt0Result as List<object?>;
        Assert.True(apiKeyRef01ListRt0 != null,
            $"expected list result to be a list, got {apiKeyRef01ListRt0Result?.GetType()}");

        var apiKeyRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(apiKeyRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = apiKeyRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(apiKeyRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = ApiKeyBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.ApiKey();
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
        var setup2 = ApiKeyBasicSetup(null);
        var ent2 = setup2.Client.ApiKey();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup ApiKeyBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "api_key",
            "ApiKeyTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse api_key test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "api_key01", "api_key02", "api_key03", "account01", "account02", "account03" },
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
            "BLUEFINPAYCONEX_TEST_API_KEY_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"])
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
