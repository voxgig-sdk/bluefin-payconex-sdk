// BluefinPayconex SDK - generated model configuration and feature
// factory. GENERATED from the API model - do not edit by hand.

namespace BluefinPayconexSdk;

public static class SdkConfig
{
    public static Dictionary<string, object?> MakeConfig()
    {
        return new Dictionary<string, object?>
        {
            ["main"] = new Dictionary<string, object?>
            {
                ["name"] = "BluefinPayconex",
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://api.payconex.net/",
                ["auth"] = new Dictionary<string, object?>
                {
                    ["prefix"] = "Basic",
                },
                ["headers"] = new Dictionary<string, object?>
                {
                    ["content-type"] = "application/json",
                },
                ["entity"] = new Dictionary<string, object?>
                {
                    ["account_updater"] = new Dictionary<string, object?>(),
                    ["account_updater_schedule"] = new Dictionary<string, object?>(),
                    ["account_updater_schedule_with_result"] = new Dictionary<string, object?>(),
                    ["account_updater_subscription_with_result"] = new Dictionary<string, object?>(),
                    ["account_updater_update"] = new Dictionary<string, object?>(),
                    ["api_key"] = new Dictionary<string, object?>(),
                    ["apple_pay_merchant_detail"] = new Dictionary<string, object?>(),
                    ["apple_pay_session"] = new Dictionary<string, object?>(),
                    ["dynamic_descriptor"] = new Dictionary<string, object?>(),
                    ["i_frame_create_instance"] = new Dictionary<string, object?>(),
                    ["i_frame_instance"] = new Dictionary<string, object?>(),
                    ["iframe"] = new Dictionary<string, object?>(),
                    ["init"] = new Dictionary<string, object?>(),
                    ["list_api_key_scopes_entry"] = new Dictionary<string, object?>(),
                    ["payment_iframe"] = new Dictionary<string, object?>(),
                    ["three_d_secure_auth"] = new Dictionary<string, object?>(),
                    ["three_d_secure_browser_init"] = new Dictionary<string, object?>(),
                    ["three_d_secure_status"] = new Dictionary<string, object?>(),
                    ["transaction_detail"] = new Dictionary<string, object?>(),
                    ["webhook"] = new Dictionary<string, object?>(),
                },
            },
            ["entity"] = new Dictionary<string, object?>
            {
                ["account_updater"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>(),
                    ["name"] = "account_updater",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "record_id",
                                                ["orig"] = "record_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 2,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                        "records",
                                        "{record_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["recordId"] = "record_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "record_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "remove",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "subscription",
                            },
                            new List<object?>
                            {
                                "account",
                                "subscription",
                                "record",
                            },
                        },
                    },
                },
                ["account_updater_schedule"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "enabled",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_id",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_format",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "token",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 4,
                        },
                    },
                    ["name"] = "account_updater_schedule",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/account-updater/payconex/subscribe",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "payconex",
                                        "subscribe",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["account_updater_schedule_with_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "card",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created_at",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "enabled",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$BOOLEAN`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "expiry",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "most_recent_update",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_id",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_format",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "token",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "type",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "updated_at",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                    },
                    ["name"] = "account_updater_schedule_with_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/account-updater/pan/subscribe",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "pan",
                                        "subscribe",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "shieldconex",
                                        "subscribe",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "schedule_id",
                                                ["orig"] = "schedule_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "schedules",
                                        "{schedule_id}",
                                        "results",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["scheduleId"] = "schedule_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "schedule_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                            new List<object?>
                            {
                                "account",
                                "schedule",
                            },
                        },
                    },
                },
                ["account_updater_subscription_with_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created_at",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "enabled",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "period_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "record",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_format",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "template_ref",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "updated_at",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                    },
                    ["name"] = "account_updater_subscription_with_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                        "pan",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                        "payconex",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                        "shieldconex",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "css_42ffe2fd59e74d719970f1c966430323",
                                                ["kind"] = "param",
                                                ["name"] = "subscription_id",
                                                ["orig"] = "subscription_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "subscriptions",
                                        "{subscription_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["subscriptionId"] = "subscription_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "subscription_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "subscription",
                            },
                        },
                    },
                },
                ["account_updater_update"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "account_updater_schedule_record_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "format",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "new_expiry",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "new_token",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "old_expiry",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "old_token",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "recurring_schedule",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "update_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "updated_at",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                    },
                    ["name"] = "account_updater_update",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "update_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{account}/account-updater/updates/{updateId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "account-updater",
                                        "updates",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["account"] = "account_id",
                                            ["updateId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["api_key"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "account",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "enabled",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "expires_at",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "expires_in",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "label",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "method",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "scope",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$ARRAY`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "secret",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                    },
                    ["name"] = "api_key",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/api-keys",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "api-keys",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 25,
                                                ["kind"] = "query",
                                                ["name"] = "limit",
                                                ["orig"] = "limit",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 5,
                                                ["kind"] = "query",
                                                ["name"] = "page",
                                                ["orig"] = "page",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "words to search",
                                                ["kind"] = "query",
                                                ["name"] = "query",
                                                ["orig"] = "query",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/api-keys",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "api-keys",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "limit",
                                            "page",
                                            "query",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "api_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "resource_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "api-keys",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["resourceId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "api_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "resource_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "api-keys",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["resourceId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "api_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "resource_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "api-keys",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["resourceId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["apple_pay_merchant_detail"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "domain",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_url",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner_merchant_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "payconex_account_id",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                    },
                    ["name"] = "apple_pay_merchant_detail",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/applePay/enrollment",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "applePay",
                                        "enrollment",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/applePay/enrollment",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "applePay",
                                        "enrollment",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["apple_pay_session"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "display_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "domain_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "epoch_timestamp",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "expires_at",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_identifier",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_session_identifier",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "nonce",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "operational_analytics_identifier",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "referrer",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "retry",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "signature",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                    },
                    ["name"] = "apple_pay_session",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$INTEGER`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/applePay/session",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "applePay",
                                        "session",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["dynamic_descriptor"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "city",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "descriptor",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "state",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                    },
                    ["name"] = "dynamic_descriptor",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/dynamic_descriptors",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "dynamic_descriptors",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 25,
                                                ["kind"] = "query",
                                                ["name"] = "limit",
                                                ["orig"] = "limit",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 5,
                                                ["kind"] = "query",
                                                ["name"] = "page",
                                                ["orig"] = "page",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "words to search",
                                                ["kind"] = "query",
                                                ["name"] = "query",
                                                ["orig"] = "query",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/dynamic_descriptors",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "dynamic_descriptors",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "limit",
                                            "page",
                                            "query",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ddesc_1669911404412ae74cd5eef8f463495d6b",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "dynamic_descriptors",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ddesc_1669911404412ae74cd5eef8f463495d6b",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "dynamic_descriptors",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 180000027666,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ddesc_1669911404412ae74cd5eef8f463495d6b",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "dynamic_descriptors",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["i_frame_create_instance"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "amount",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "currency",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "customer",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "initialize_transaction",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "label",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "timeout",
                            ["req"] = false,
                            ["type"] = "`$NUMBER`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "token",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 8,
                        },
                    },
                    ["name"] = "i_frame_create_instance",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                                                ["kind"] = "param",
                                                ["name"] = "payment_iframe_id",
                                                ["orig"] = "iframe_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                        "{payment_iframe_id}",
                                        "instance",
                                        "init",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["iframeId"] = "payment_iframe_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "payment_iframe_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "payment_iframe",
                            },
                        },
                    },
                },
                ["i_frame_instance"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>(),
                    ["name"] = "i_frame_instance",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "iframe_instance_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                                                ["kind"] = "param",
                                                ["name"] = "payment_iframe_id",
                                                ["orig"] = "iframe_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 2,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                        "{payment_iframe_id}",
                                        "instance",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["iframeId"] = "payment_iframe_id",
                                            ["iframeInstanceId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                            "payment_iframe_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "payment_iframe",
                            },
                        },
                    },
                },
                ["iframe"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "ach_setting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "allowed_parent_domain",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$ARRAY`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$ARRAY`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "allowed_payment_method",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$ARRAY`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$ARRAY`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "card_setting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "click_to_pay_setting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "currency",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "label",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "timeout",
                            ["req"] = false,
                            ["type"] = "`$NUMBER`",
                            ["index$"] = 9,
                        },
                    },
                    ["name"] = "iframe",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifr_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "iframe_id",
                                                ["orig"] = "iframe_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                        "{iframe_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["iframeId"] = "iframe_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "iframe_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifr_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "iframe_id",
                                                ["orig"] = "iframe_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                        "{iframe_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["iframeId"] = "iframe_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "iframe_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                            new List<object?>
                            {
                                "account",
                                "payment_iframe",
                            },
                        },
                    },
                },
                ["init"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "customer",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "item",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "level2",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "level3",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "shipping_address",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "trace",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                    },
                    ["name"] = "init",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payments/init",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payments",
                                        "init",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["list_api_key_scopes_entry"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "category",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "enabled",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "level",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "scope",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                    },
                    ["name"] = "list_api_key_scopes_entry",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/api-key-scopes",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "api-key-scopes",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["payment_iframe"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>(),
                    ["name"] = "payment_iframe",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "ifr_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "iframe_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payment-iframe",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["iframeId"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["three_d_secure_auth"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "browser",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "card",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "challenge",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "customer",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "purchase",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "server_transaction_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "shipping",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure_challenge_indicator",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "trace",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                    },
                    ["name"] = "three_d_secure_auth",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "tds_23d0e53de3c64e94887116da65abc8ce",
                                                ["kind"] = "param",
                                                ["name"] = "3_d_id",
                                                ["orig"] = "resource_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "3DS",
                                        "{3_d_id}",
                                        "browser-authenticate",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["resourceId"] = "3_d_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "3_d_id",
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "3_d",
                            },
                        },
                    },
                },
                ["three_d_secure_browser_init"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "acs_result_url",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "acs_url",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "cvv",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "expiry",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "pan",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "payment_details_reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "server_transaction_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure_data",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                    },
                    ["name"] = "three_d_secure_browser_init",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/3DS/init-card-details",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "3DS",
                                        "init-card-details",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
                ["three_d_secure_status"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "error",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "info",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "server_transaction_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "three_d_secure_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                    },
                    ["name"] = "three_d_secure_status",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "tds_23d0e53de3c64e94887116da65abc8ce",
                                                ["kind"] = "param",
                                                ["name"] = "3_d_id",
                                                ["orig"] = "resource_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/3DS/{resourceId}/status",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "3DS",
                                        "{3_d_id}",
                                        "status",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["resourceId"] = "3_d_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "3_d_id",
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "3_d",
                            },
                        },
                    },
                },
                ["transaction_detail"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "amount",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "auth",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "card",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "customer",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "item",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "level2",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "level3",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "override",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "shipping_address",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["update"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "timestamp",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "trace",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 13,
                        },
                    },
                    ["name"] = "transaction_detail",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 1861,
                                                ["kind"] = "param",
                                                ["name"] = "transaction_id",
                                                ["orig"] = "transaction_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payments/{transactionId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payments",
                                        "{transaction_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["transactionId"] = "transaction_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "transaction_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 1861,
                                                ["kind"] = "param",
                                                ["name"] = "transaction_id",
                                                ["orig"] = "transaction_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{accountId}/payments/{transactionId}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "payments",
                                        "{transaction_id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["transactionId"] = "transaction_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "transaction_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                                "payment",
                            },
                        },
                    },
                },
                ["webhook"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "event",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "url",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                    },
                    ["name"] = "webhook",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/api/v4/accounts/{accountId}/webhooks",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "webhooks",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "120615523104",
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/webhooks",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "webhooks",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "wbh_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "webhook_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "webhooks",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["webhookID"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "wbh_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "webhook_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "webhooks",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["webhookID"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 120615523104,
                                                ["kind"] = "param",
                                                ["name"] = "account_id",
                                                ["orig"] = "account_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "wbh_d193148ac2624de7b43a191682a8822f",
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "webhook_id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                                    ["parts"] = new List<object?>
                                    {
                                        "api",
                                        "v4",
                                        "accounts",
                                        "{account_id}",
                                        "webhooks",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["accountId"] = "account_id",
                                            ["webhookID"] = "id",
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "account_id",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "update",
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "account",
                            },
                        },
                    },
                },
            },
        };
    }

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "test":
                return new Feature.TestFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}
