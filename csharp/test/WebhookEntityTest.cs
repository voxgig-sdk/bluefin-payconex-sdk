// webhook entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class WebhookEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.Webhook();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = WebhookBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "update", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "webhook." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var webhookRef01Ent = client.Webhook();
        var webhookRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "webhook")),
            "webhook_ref01"));
        webhookRef01Data!["account_id"] = setup.Idmap["account01"];

        var webhookRef01DataResult = webhookRef01Ent.Create(webhookRef01Data, null);
        webhookRef01Data = Helpers.ToMapAny(webhookRef01DataResult);
        Assert.True(webhookRef01Data != null, "expected create result to be a map");
        Assert.True(webhookRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var webhookRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var webhookRef01ListResult = webhookRef01Ent.List(webhookRef01Match, null);
        var webhookRef01List = webhookRef01ListResult as List<object?>;
        Assert.True(webhookRef01List != null,
            $"expected list result to be a list, got {webhookRef01ListResult?.GetType()}");

        var webhookRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(webhookRef01List!),
            new Dictionary<string, object?> { ["id"] = webhookRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(webhookRef01ListFound),
            "expected to find created entity in list");

        // UPDATE
        var webhookRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = webhookRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var webhookRef01MarkdefUp0Name = "event";
        var webhookRef01MarkdefUp0Value = $"Mark01-webhook_ref01_{setup.Now}";
        webhookRef01DataUp0Up[webhookRef01MarkdefUp0Name] = webhookRef01MarkdefUp0Value;

        var webhookRef01ResdataUp0Result = webhookRef01Ent.Update(webhookRef01DataUp0Up, null);
        var webhookRef01ResdataUp0 = Helpers.ToMapAny(webhookRef01ResdataUp0Result);
        Assert.True(webhookRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(webhookRef01ResdataUp0!["id"], webhookRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(webhookRef01ResdataUp0![webhookRef01MarkdefUp0Name], webhookRef01MarkdefUp0Value),
            $"expected {webhookRef01MarkdefUp0Name} to be updated, got {webhookRef01ResdataUp0[webhookRef01MarkdefUp0Name]}");

        // LOAD
        var webhookRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = webhookRef01Data!["id"],
        };
        var webhookRef01DataDt0Loaded = webhookRef01Ent.Load(webhookRef01MatchDt0, null);
        var webhookRef01DataDt0LoadResult = Helpers.ToMapAny(webhookRef01DataDt0Loaded);
        Assert.True(webhookRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(webhookRef01DataDt0LoadResult!["id"], webhookRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var webhookRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = webhookRef01Data!["id"],
        };
        webhookRef01Ent.Remove(webhookRef01MatchRm0, null);

        // LIST
        var webhookRef01MatchRt0 = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
        };

        var webhookRef01ListRt0Result = webhookRef01Ent.List(webhookRef01MatchRt0, null);
        var webhookRef01ListRt0 = webhookRef01ListRt0Result as List<object?>;
        Assert.True(webhookRef01ListRt0 != null,
            $"expected list result to be a list, got {webhookRef01ListRt0Result?.GetType()}");

        var webhookRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(webhookRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = webhookRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(webhookRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = WebhookBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.Webhook();
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
        var setup2 = WebhookBasicSetup(null);
        var ent2 = setup2.Client.Webhook();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup WebhookBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "webhook",
            "WebhookTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse webhook test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "webhook01", "webhook02", "webhook03", "account01", "account02", "account03" },
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
            "BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"])
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
