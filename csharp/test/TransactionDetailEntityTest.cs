// transaction_detail entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class TransactionDetailEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        var ent = testsdk.TransactionDetail();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = TransactionDetailBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "update", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "transaction_detail." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // Bootstrap entity data from existing test data (no create step in flow).
        var transactionDetailRef01DataRaw = StructUtils.Items(
            Helpers.ToMapAny(StructUtils.GetPath(setup.Data, "existing.transaction_detail")));
        var transactionDetailRef01Data = transactionDetailRef01DataRaw.Count > 0
            ? Helpers.ToMapAny(transactionDetailRef01DataRaw[0][1])
            : null;

        // UPDATE
        var transactionDetailRef01Ent = client.TransactionDetail();
        var transactionDetailRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = transactionDetailRef01Data!["id"],
            ["account_id"] = setup.Idmap["account_id"],
        };

        var transactionDetailRef01MarkdefUp0Name = "description";
        var transactionDetailRef01MarkdefUp0Value = $"Mark01-transaction_detail_ref01_{setup.Now}";
        transactionDetailRef01DataUp0Up[transactionDetailRef01MarkdefUp0Name] = transactionDetailRef01MarkdefUp0Value;

        var transactionDetailRef01ResdataUp0Result = transactionDetailRef01Ent.Update(transactionDetailRef01DataUp0Up, null);
        var transactionDetailRef01ResdataUp0 = Helpers.ToMapAny(transactionDetailRef01ResdataUp0Result);
        Assert.True(transactionDetailRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(transactionDetailRef01ResdataUp0!["id"], transactionDetailRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(transactionDetailRef01ResdataUp0![transactionDetailRef01MarkdefUp0Name], transactionDetailRef01MarkdefUp0Value),
            $"expected {transactionDetailRef01MarkdefUp0Name} to be updated, got {transactionDetailRef01ResdataUp0[transactionDetailRef01MarkdefUp0Name]}");

        // LOAD
        var transactionDetailRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = transactionDetailRef01Data!["id"],
        };
        var transactionDetailRef01DataDt0Loaded = transactionDetailRef01Ent.Load(transactionDetailRef01MatchDt0, null);
        var transactionDetailRef01DataDt0LoadResult = Helpers.ToMapAny(transactionDetailRef01DataDt0Loaded);
        Assert.True(transactionDetailRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(transactionDetailRef01DataDt0LoadResult!["id"], transactionDetailRef01Data["id"]),
            "expected load result id to match");

    }

    private static EntityTestSetup TransactionDetailBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "transaction_detail",
            "TransactionDetailTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse transaction_detail test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinPayconexSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "transaction_detail01", "transaction_detail02", "transaction_detail03", "account01", "account02", "account03", "payment01", "payment02", "payment03" },
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
            "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"] = idmap,
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"])
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
