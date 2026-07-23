// account_updater_schedule_with_result entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class AccountUpdaterScheduleWithResultEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.AccountUpdaterScheduleWithResult();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = AccountUpdaterScheduleWithResultBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "account_updater_schedule_with_result." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var accountUpdaterScheduleWithResultRef01Ent = client.AccountUpdaterScheduleWithResult();
        var accountUpdaterScheduleWithResultRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "account_updater_schedule_with_result")),
            "account_updater_schedule_with_result_ref01"));
        accountUpdaterScheduleWithResultRef01Data!["account_id"] = setup.Idmap["account01"];
        accountUpdaterScheduleWithResultRef01Data!["schedule_id"] = setup.Idmap["schedule01"];

        var accountUpdaterScheduleWithResultRef01DataResult = accountUpdaterScheduleWithResultRef01Ent.Create(accountUpdaterScheduleWithResultRef01Data, null);
        accountUpdaterScheduleWithResultRef01Data = Helpers.ToMapAny(accountUpdaterScheduleWithResultRef01DataResult);
        Assert.True(accountUpdaterScheduleWithResultRef01Data != null, "expected create result to be a map");
        Assert.True(accountUpdaterScheduleWithResultRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var accountUpdaterScheduleWithResultRef01Match = new Dictionary<string, object?>
        {
            ["account_id"] = setup.Idmap["account01"],
            ["schedule_id"] = setup.Idmap["schedule01"],
        };

        var accountUpdaterScheduleWithResultRef01ListResult = accountUpdaterScheduleWithResultRef01Ent.List(accountUpdaterScheduleWithResultRef01Match, null);
        var accountUpdaterScheduleWithResultRef01List = accountUpdaterScheduleWithResultRef01ListResult as List<object?>;
        Assert.True(accountUpdaterScheduleWithResultRef01List != null,
            $"expected list result to be a list, got {accountUpdaterScheduleWithResultRef01ListResult?.GetType()}");

        var accountUpdaterScheduleWithResultRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(accountUpdaterScheduleWithResultRef01List!),
            new Dictionary<string, object?> { ["id"] = accountUpdaterScheduleWithResultRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(accountUpdaterScheduleWithResultRef01ListFound),
            "expected to find created entity in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = AccountUpdaterScheduleWithResultBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.AccountUpdaterScheduleWithResult();
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
        var setup2 = AccountUpdaterScheduleWithResultBasicSetup(null);
        var ent2 = setup2.Client.AccountUpdaterScheduleWithResult();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup AccountUpdaterScheduleWithResultBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "account_updater_schedule_with_result",
            "AccountUpdaterScheduleWithResultTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse account_updater_schedule_with_result test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "account_updater_schedule_with_result01", "account_updater_schedule_with_result02", "account_updater_schedule_with_result03", "account01", "account02", "account03", "schedule01", "schedule02", "schedule03" },
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
            "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"])
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
