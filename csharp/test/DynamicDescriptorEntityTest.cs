// dynamic_descriptor entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class DynamicDescriptorEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.DynamicDescriptor();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = DynamicDescriptorBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "update", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "dynamic_descriptor." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var dynamicDescriptorRef01Ent = client.DynamicDescriptor();
        var dynamicDescriptorRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "dynamic_descriptor")),
            "dynamic_descriptor_ref01"));
        dynamicDescriptorRef01Data!["account_id"] = setup.Idmap["account01"];

        var dynamicDescriptorRef01DataResult = dynamicDescriptorRef01Ent.Create(dynamicDescriptorRef01Data, null);
        dynamicDescriptorRef01Data = Helpers.ToMapAny(dynamicDescriptorRef01DataResult);
        Assert.True(dynamicDescriptorRef01Data != null, "expected create result to be a map");
        Assert.True(dynamicDescriptorRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var dynamicDescriptorRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var dynamicDescriptorRef01ListResult = dynamicDescriptorRef01Ent.List(dynamicDescriptorRef01Match, null);
        var dynamicDescriptorRef01List = dynamicDescriptorRef01ListResult as List<object?>;
        Assert.True(dynamicDescriptorRef01List != null,
            $"expected list result to be a list, got {dynamicDescriptorRef01ListResult?.GetType()}");

        var dynamicDescriptorRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(dynamicDescriptorRef01List!),
            new Dictionary<string, object?> { ["id"] = dynamicDescriptorRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(dynamicDescriptorRef01ListFound),
            "expected to find created entity in list");

        // UPDATE
        var dynamicDescriptorRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = dynamicDescriptorRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var dynamicDescriptorRef01MarkdefUp0Name = "city";
        var dynamicDescriptorRef01MarkdefUp0Value = $"Mark01-dynamic_descriptor_ref01_{setup.Now}";
        dynamicDescriptorRef01DataUp0Up[dynamicDescriptorRef01MarkdefUp0Name] = dynamicDescriptorRef01MarkdefUp0Value;

        var dynamicDescriptorRef01ResdataUp0Result = dynamicDescriptorRef01Ent.Update(dynamicDescriptorRef01DataUp0Up, null);
        var dynamicDescriptorRef01ResdataUp0 = Helpers.ToMapAny(dynamicDescriptorRef01ResdataUp0Result);
        Assert.True(dynamicDescriptorRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(dynamicDescriptorRef01ResdataUp0!["id"], dynamicDescriptorRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(dynamicDescriptorRef01ResdataUp0![dynamicDescriptorRef01MarkdefUp0Name], dynamicDescriptorRef01MarkdefUp0Value),
            $"expected {dynamicDescriptorRef01MarkdefUp0Name} to be updated, got {dynamicDescriptorRef01ResdataUp0[dynamicDescriptorRef01MarkdefUp0Name]}");

        // LOAD
        var dynamicDescriptorRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = dynamicDescriptorRef01Data!["id"],
        };
        var dynamicDescriptorRef01DataDt0Loaded = dynamicDescriptorRef01Ent.Load(dynamicDescriptorRef01MatchDt0, null);
        var dynamicDescriptorRef01DataDt0LoadResult = Helpers.ToMapAny(dynamicDescriptorRef01DataDt0Loaded);
        Assert.True(dynamicDescriptorRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(dynamicDescriptorRef01DataDt0LoadResult!["id"], dynamicDescriptorRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var dynamicDescriptorRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = dynamicDescriptorRef01Data!["id"],
        };
        dynamicDescriptorRef01Ent.Remove(dynamicDescriptorRef01MatchRm0, null);

        // LIST
        var dynamicDescriptorRef01MatchRt0 = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var dynamicDescriptorRef01ListRt0Result = dynamicDescriptorRef01Ent.List(dynamicDescriptorRef01MatchRt0, null);
        var dynamicDescriptorRef01ListRt0 = dynamicDescriptorRef01ListRt0Result as List<object?>;
        Assert.True(dynamicDescriptorRef01ListRt0 != null,
            $"expected list result to be a list, got {dynamicDescriptorRef01ListRt0Result?.GetType()}");

        var dynamicDescriptorRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(dynamicDescriptorRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = dynamicDescriptorRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(dynamicDescriptorRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = DynamicDescriptorBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.DynamicDescriptor();
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
        var setup2 = DynamicDescriptorBasicSetup(null);
        var ent2 = setup2.Client.DynamicDescriptor();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup DynamicDescriptorBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "dynamic_descriptor",
            "DynamicDescriptorTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse dynamic_descriptor test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "dynamic_descriptor01", "dynamic_descriptor02", "dynamic_descriptor03", "account01", "account02", "account03" },
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
            "BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"])
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
