// account_updater_schedule_with_result direct API tests (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinPayconexSdk.Test;

public class AccountUpdaterScheduleWithResultDirectTest
{
    [Fact]
    public void DirectList()
    {
        var setup = AccountUpdaterScheduleWithResultDirectSetup(new List<object?>
        {
            new Dictionary<string, object?> { ["id"] = "direct01" },
            new Dictionary<string, object?> { ["id"] = "direct02" },
        });
        var _mode = setup.Live ? "live" : "unit";
        var (_shouldSkip, _) = TestRunner.IsControlSkipped(
            "direct", "direct-list-account_updater_schedule_with_result", _mode);
        if (_shouldSkip)
        {
            return; // skipped via sdk-test-control.json
        }
        if (setup.Live)
        {
            foreach (var _liveKey in new[] { "account01", "schedule01" })
            {
                if (StructUtils.GetProp(setup.Idmap, _liveKey) == null)
                {
                    return; // live test needs *_ENTID env var (synthetic IDs only)
                }
            }
        }
        var client = setup.Client;

        var pathParams = new Dictionary<string, object?>();
        if (setup.Live)
        {
            pathParams["account_id"] = setup.Idmap["account01"];
        }
        else
        {
            pathParams["account_id"] = "direct01";
        }
        if (setup.Live)
        {
            pathParams["schedule_id"] = setup.Idmap["schedule01"];
        }
        else
        {
            pathParams["schedule_id"] = "direct02";
        }

        var result = client.Direct(new Dictionary<string, object?>
        {
            ["path"] = "api/v4/accounts/{account_id}/account-updater/schedules/{schedule_id}/results",
            ["method"] = "GET",
            ["params"] = pathParams,
        });
        if (setup.Live)
        {
            // Live mode is lenient: synthetic IDs frequently 4xx and the
            // list-response shape varies wildly across public APIs. Bail
            // rather than fail when the call doesn't return a usable list.
            if (!Equals(result["ok"], true))
            {
                return;
            }
            var status = Helpers.ToInt(result["status"]);
            if (status < 200 || status >= 300)
            {
                return;
            }
        }
        else
        {
            Assert.True(Equals(result["ok"], true),
                $"expected ok to be true, got {result.GetValueOrDefault("err")}");
            Assert.Equal(200, Helpers.ToInt(result["status"]));
        }

        if (!setup.Live)
        {
            var dataList = result["data"] as List<object?>;
            Assert.True(dataList != null, "expected data to be a list");
            Assert.Equal(2, dataList!.Count);

            Assert.True(setup.Calls.Count == 1,
                $"expected 1 call, got {setup.Calls.Count}");
            var call = setup.Calls[0];
            var init = call["init"] as Dictionary<string, object?>;
            Assert.Equal("GET", init?["method"]);
            var url = call["url"] as string ?? "";
            Assert.Contains("direct01", url);
            Assert.Contains("direct02", url);
        }
    }

    private class AccountUpdaterScheduleWithResultDirectSetupResult
    {
        public BluefinPayconexSDK Client = null!;
        public List<Dictionary<string, object?>> Calls = new();
        public bool Live;
        public Dictionary<string, object?> Idmap = new();
    }

    private static AccountUpdaterScheduleWithResultDirectSetupResult AccountUpdaterScheduleWithResultDirectSetup(object? mockres)
    {
        TestRunner.LoadEnvLocal();

        var calls = new List<Dictionary<string, object?>>();

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"] = new Dictionary<string, object?>(),
            ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
            ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
        });

        var live = Equals(env["BLUEFINPAYCONEX_TEST_LIVE"], "TRUE");

        if (live)
        {
            var liveClient = new BluefinPayconexSDK(new Dictionary<string, object?>
            {
                ["apikey"] = env["BLUEFINPAYCONEX_APIKEY"],
            });

            var idmap = new Dictionary<string, object?>();
            var entidRaw = env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"];
            if (entidRaw is string entidStr && entidStr.StartsWith("{"))
            {
                try
                {
                    var el = JsonSerializer.Deserialize<JsonElement>(entidStr);
                    idmap = StructRunner.ConvertElement(el)
                        as Dictionary<string, object?> ?? idmap;
                }
                catch (JsonException)
                {
                }
            }
            else if (entidRaw is Dictionary<string, object?> entidMap)
            {
                idmap = entidMap;
            }

            return new AccountUpdaterScheduleWithResultDirectSetupResult
            {
                Client = liveClient,
                Calls = calls,
                Live = true,
                Idmap = idmap,
            };
        }

        Func<string, Dictionary<string, object?>, Dictionary<string, object?>> mockFetch =
            (url, init) =>
            {
                calls.Add(new Dictionary<string, object?>
                {
                    ["url"] = url,
                    ["init"] = init,
                });
                return new Dictionary<string, object?>
                {
                    ["status"] = 200,
                    ["statusText"] = "OK",
                    ["headers"] = new Dictionary<string, object?>(),
                    ["json"] = (Func<object?>)(() =>
                        mockres ?? new Dictionary<string, object?> { ["id"] = "direct01" }),
                };
            };

        var client = new BluefinPayconexSDK(new Dictionary<string, object?>
        {
            ["base"] = "http://localhost:8080",
            ["system"] = new Dictionary<string, object?>
            {
                ["fetch"] = mockFetch,
            },
        });

        return new AccountUpdaterScheduleWithResultDirectSetupResult
        {
            Client = client,
            Calls = calls,
            Live = false,
            Idmap = new Dictionary<string, object?>(),
        };
    }
}
