// account_updater_subscription_with_result entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class AccountUpdaterSubscriptionWithResultEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.AccountUpdaterSubscriptionWithResult();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = AccountUpdaterSubscriptionWithResultBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "update", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "account_updater_subscription_with_result." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var accountUpdaterSubscriptionWithResultRef01Ent = client.AccountUpdaterSubscriptionWithResult();
        var accountUpdaterSubscriptionWithResultRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "account_updater_subscription_with_result")),
            "account_updater_subscription_with_result_ref01"));
        accountUpdaterSubscriptionWithResultRef01Data!["account_id"] = setup.Idmap["account01"];
        accountUpdaterSubscriptionWithResultRef01Data!["subscription_id"] = setup.Idmap["subscription01"];

        var accountUpdaterSubscriptionWithResultRef01DataResult = accountUpdaterSubscriptionWithResultRef01Ent.Create(accountUpdaterSubscriptionWithResultRef01Data, null);
        accountUpdaterSubscriptionWithResultRef01Data = Helpers.ToMapAny(accountUpdaterSubscriptionWithResultRef01DataResult);
        Assert.True(accountUpdaterSubscriptionWithResultRef01Data != null, "expected create result to be a map");
        Assert.True(accountUpdaterSubscriptionWithResultRef01Data!["id"] != null, "expected created entity to have an id");

        // UPDATE
        var accountUpdaterSubscriptionWithResultRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = accountUpdaterSubscriptionWithResultRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name = "created_at";
        var accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value = $"Mark01-account_updater_subscription_with_result_ref01_{setup.Now}";
        accountUpdaterSubscriptionWithResultRef01DataUp0Up[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name] = accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value;

        var accountUpdaterSubscriptionWithResultRef01ResdataUp0Result = accountUpdaterSubscriptionWithResultRef01Ent.Update(accountUpdaterSubscriptionWithResultRef01DataUp0Up, null);
        var accountUpdaterSubscriptionWithResultRef01ResdataUp0 = Helpers.ToMapAny(accountUpdaterSubscriptionWithResultRef01ResdataUp0Result);
        Assert.True(accountUpdaterSubscriptionWithResultRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(accountUpdaterSubscriptionWithResultRef01ResdataUp0!["id"], accountUpdaterSubscriptionWithResultRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(accountUpdaterSubscriptionWithResultRef01ResdataUp0![accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name], accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value),
            $"expected {accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name} to be updated, got {accountUpdaterSubscriptionWithResultRef01ResdataUp0[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name]}");

        // LOAD
        var accountUpdaterSubscriptionWithResultRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = accountUpdaterSubscriptionWithResultRef01Data!["id"],
        };
        var accountUpdaterSubscriptionWithResultRef01DataDt0Loaded = accountUpdaterSubscriptionWithResultRef01Ent.Load(accountUpdaterSubscriptionWithResultRef01MatchDt0, null);
        var accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult = Helpers.ToMapAny(accountUpdaterSubscriptionWithResultRef01DataDt0Loaded);
        Assert.True(accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult!["id"], accountUpdaterSubscriptionWithResultRef01Data["id"]),
            "expected load result id to match");

    }

    private static EntityTestSetup AccountUpdaterSubscriptionWithResultBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "account_updater_subscription_with_result",
            "AccountUpdaterSubscriptionWithResultTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse account_updater_subscription_with_result test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "account_updater_subscription_with_result01", "account_updater_subscription_with_result02", "account_updater_subscription_with_result03", "account01", "account02", "account03", "subscription01", "subscription02", "subscription03" },
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
            "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"])
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
