// Generated API configuration (mirrors go/rust core/config).

const std = @import("std");
const h = @import("helpers.zig");
const types = @import("types.zig");
const Value = h.Value;
const Feature = types.Feature;

pub fn make_config() Value {
    return h.jo(&.{
        .{ "main", h.jo(&.{
            .{ "name", h.vstr("BluefinPayconex") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://api.payconex.net/") },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "account_updater", h.omap() },
                .{ "account_updater_schedule", h.omap() },
                .{ "account_updater_schedule_with_result", h.omap() },
                .{ "account_updater_subscription_with_result", h.omap() },
                .{ "account_updater_update", h.omap() },
                .{ "api_key", h.omap() },
                .{ "apple_pay_merchant_detail", h.omap() },
                .{ "apple_pay_session", h.omap() },
                .{ "dynamic_descriptor", h.omap() },
                .{ "i_frame_create_instance", h.omap() },
                .{ "i_frame_instance", h.omap() },
                .{ "iframe", h.omap() },
                .{ "init", h.omap() },
                .{ "list_api_key_scopes_entry", h.omap() },
                .{ "payment_iframe", h.omap() },
                .{ "three_d_secure_auth", h.omap() },
                .{ "three_d_secure_browser_init", h.omap() },
                .{ "three_d_secure_status", h.omap() },
                .{ "transaction_detail", h.omap() },
                .{ "webhook", h.omap() },
            }) },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "account_updater", h.jo(&.{
                .{ "fields", h.olist() },
                .{ "name", h.vstr("account_updater") },
                .{ "op", h.jo(&.{
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("record_id") },
                                            .{ "orig", h.vstr("record_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(2) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                    h.vstr("records"),
                                    h.vstr("{record_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "recordId", h.vstr("record_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("record_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("subscription"),
                        }),
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("subscription"),
                            h.vstr("record"),
                        }),
                    }) },
                }) },
            }) },
            .{ "account_updater_schedule", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("enabled") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_id") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_format") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("token") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(4) },
                    }),
                }) },
                .{ "name", h.vstr("account_updater_schedule") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/account-updater/payconex/subscribe") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("payconex"),
                                    h.vstr("subscribe"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "account_updater_schedule_with_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("card") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created_at") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("enabled") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$BOOLEAN`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expiry") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("most_recent_update") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_id") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_format") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("token") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("type") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("updated_at") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                }) },
                .{ "name", h.vstr("account_updater_schedule_with_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/account-updater/pan/subscribe") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("pan"),
                                    h.vstr("subscribe"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("shieldconex"),
                                    h.vstr("subscribe"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("schedule_id") },
                                            .{ "orig", h.vstr("schedule_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("schedules"),
                                    h.vstr("{schedule_id}"),
                                    h.vstr("results"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "scheduleId", h.vstr("schedule_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("schedule_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("schedule"),
                        }),
                    }) },
                }) },
            }) },
            .{ "account_updater_subscription_with_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created_at") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("enabled") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("period_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("record") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_format") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("template_ref") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("updated_at") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                }) },
                .{ "name", h.vstr("account_updater_subscription_with_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                    h.vstr("pan"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                    h.vstr("payconex"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                    h.vstr("shieldconex"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("css_42ffe2fd59e74d719970f1c966430323") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("subscription_id") },
                                            .{ "orig", h.vstr("subscription_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("subscriptions"),
                                    h.vstr("{subscription_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "subscriptionId", h.vstr("subscription_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("subscription_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("subscription"),
                        }),
                    }) },
                }) },
            }) },
            .{ "account_updater_update", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("account_updater_schedule_record_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("format") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("new_expiry") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("new_token") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("old_expiry") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("old_token") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("recurring_schedule") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("update_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("updated_at") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                }) },
                .{ "name", h.vstr("account_updater_update") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("update_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{account}/account-updater/updates/{updateId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("account-updater"),
                                    h.vstr("updates"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "account", h.vstr("account_id") },
                                        .{ "updateId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "api_key", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("account") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("enabled") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expires_at") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expires_in") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("label") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("method") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("scope") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("secret") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                }) },
                .{ "name", h.vstr("api_key") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/api-keys") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("api-keys"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(25) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("limit") },
                                            .{ "orig", h.vstr("limit") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(5) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("page") },
                                            .{ "orig", h.vstr("page") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("words to search") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("query") },
                                            .{ "orig", h.vstr("query") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/api-keys") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("api-keys"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("limit"),
                                        h.vstr("page"),
                                        h.vstr("query"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("api_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("resource_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/api-keys/{resourceId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("api-keys"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "resourceId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("api_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("resource_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/api-keys/{resourceId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("api-keys"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "resourceId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("api_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("resource_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/api-keys/{resourceId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("api-keys"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "resourceId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "apple_pay_merchant_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("domain") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_url") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner_merchant_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("payconex_account_id") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                }) },
                .{ "name", h.vstr("apple_pay_merchant_detail") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/applePay/enrollment") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("applePay"),
                                    h.vstr("enrollment"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/applePay/enrollment") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("applePay"),
                                    h.vstr("enrollment"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "apple_pay_session", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("display_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("domain_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("epoch_timestamp") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expires_at") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_identifier") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_session_identifier") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("nonce") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("operational_analytics_identifier") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("referrer") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("retry") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("signature") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                }) },
                .{ "name", h.vstr("apple_pay_session") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/applePay/session") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("applePay"),
                                    h.vstr("session"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "dynamic_descriptor", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("city") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("descriptor") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("state") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                }) },
                .{ "name", h.vstr("dynamic_descriptor") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/dynamic_descriptors") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("dynamic_descriptors"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(25) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("limit") },
                                            .{ "orig", h.vstr("limit") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(5) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("page") },
                                            .{ "orig", h.vstr("page") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("words to search") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("query") },
                                            .{ "orig", h.vstr("query") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/dynamic_descriptors") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("dynamic_descriptors"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("limit"),
                                        h.vstr("page"),
                                        h.vstr("query"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ddesc_1669911404412ae74cd5eef8f463495d6b") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("dynamic_descriptors"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ddesc_1669911404412ae74cd5eef8f463495d6b") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("dynamic_descriptors"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(180000027666) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ddesc_1669911404412ae74cd5eef8f463495d6b") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("dynamic_descriptors"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "i_frame_create_instance", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("amount") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("customer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("initialize_transaction") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("label") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reference") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("timeout") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$NUMBER`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("token") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(8) },
                    }),
                }) },
                .{ "name", h.vstr("i_frame_create_instance") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("payment_iframe_id") },
                                            .{ "orig", h.vstr("iframe_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                    h.vstr("{payment_iframe_id}"),
                                    h.vstr("instance"),
                                    h.vstr("init"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "iframeId", h.vstr("payment_iframe_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("payment_iframe_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("payment_iframe"),
                        }),
                    }) },
                }) },
            }) },
            .{ "i_frame_instance", h.jo(&.{
                .{ "fields", h.olist() },
                .{ "name", h.vstr("i_frame_instance") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("iframe_instance_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("payment_iframe_id") },
                                            .{ "orig", h.vstr("iframe_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(2) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                    h.vstr("{payment_iframe_id}"),
                                    h.vstr("instance"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "iframeId", h.vstr("payment_iframe_id") },
                                        .{ "iframeInstanceId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                        h.vstr("payment_iframe_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("payment_iframe"),
                        }),
                    }) },
                }) },
            }) },
            .{ "iframe", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("ach_setting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("allowed_parent_domain") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("allowed_payment_method") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("card_setting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("click_to_pay_setting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("label") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("timeout") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$NUMBER`") },
                        .{ "index$", h.vnum(9) },
                    }),
                }) },
                .{ "name", h.vstr("iframe") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifr_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("iframe_id") },
                                            .{ "orig", h.vstr("iframe_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                    h.vstr("{iframe_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "iframeId", h.vstr("iframe_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("iframe_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifr_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("iframe_id") },
                                            .{ "orig", h.vstr("iframe_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                    h.vstr("{iframe_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "iframeId", h.vstr("iframe_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("iframe_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("payment_iframe"),
                        }),
                    }) },
                }) },
            }) },
            .{ "init", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("customer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("item") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("level2") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("level3") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("shipping_address") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("trace") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                }) },
                .{ "name", h.vstr("init") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payments/init") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payments"),
                                    h.vstr("init"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "list_api_key_scopes_entry", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("category") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("enabled") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("level") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("scope") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                }) },
                .{ "name", h.vstr("list_api_key_scopes_entry") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/api-key-scopes") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("api-key-scopes"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "payment_iframe", h.jo(&.{
                .{ "fields", h.olist() },
                .{ "name", h.vstr("payment_iframe") },
                .{ "op", h.jo(&.{
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("ifr_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("iframe_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payment-iframe"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "iframeId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "three_d_secure_auth", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("browser") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("card") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("challenge") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("customer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("purchase") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("server_transaction_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("shipping") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure_challenge_indicator") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("trace") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                }) },
                .{ "name", h.vstr("three_d_secure_auth") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("tds_23d0e53de3c64e94887116da65abc8ce") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("3_d_id") },
                                            .{ "orig", h.vstr("resource_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("3DS"),
                                    h.vstr("{3_d_id}"),
                                    h.vstr("browser-authenticate"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "resourceId", h.vstr("3_d_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("3_d_id"),
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("3_d"),
                        }),
                    }) },
                }) },
            }) },
            .{ "three_d_secure_browser_init", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("acs_result_url") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("acs_url") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("cvv") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expiry") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("pan") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("payment_details_reference") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("server_transaction_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure_data") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                }) },
                .{ "name", h.vstr("three_d_secure_browser_init") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/3DS/init-card-details") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("3DS"),
                                    h.vstr("init-card-details"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
            .{ "three_d_secure_status", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("error") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("info") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("server_transaction_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("three_d_secure_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                }) },
                .{ "name", h.vstr("three_d_secure_status") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("tds_23d0e53de3c64e94887116da65abc8ce") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("3_d_id") },
                                            .{ "orig", h.vstr("resource_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/3DS/{resourceId}/status") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("3DS"),
                                    h.vstr("{3_d_id}"),
                                    h.vstr("status"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "resourceId", h.vstr("3_d_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("3_d_id"),
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("3_d"),
                        }),
                    }) },
                }) },
            }) },
            .{ "transaction_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("amount") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("auth") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("card") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("customer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("item") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("level2") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("level3") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("override") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("shipping_address") },
                        .{ "op", h.jo(&.{
                            .{ "update", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("timestamp") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("trace") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(13) },
                    }),
                }) },
                .{ "name", h.vstr("transaction_detail") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(1861) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("transaction_id") },
                                            .{ "orig", h.vstr("transaction_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payments/{transactionId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payments"),
                                    h.vstr("{transaction_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "transactionId", h.vstr("transaction_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("transaction_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(1861) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("transaction_id") },
                                            .{ "orig", h.vstr("transaction_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/payments/{transactionId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("payments"),
                                    h.vstr("{transaction_id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "transactionId", h.vstr("transaction_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("transaction_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                            h.vstr("payment"),
                        }),
                    }) },
                }) },
            }) },
            .{ "webhook", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("event") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("url") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                }) },
                .{ "name", h.vstr("webhook") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/webhooks") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("webhooks"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("120615523104") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/webhooks") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("webhooks"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("wbh_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("webhook_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/webhooks/{webhookID}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("webhooks"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "webhookID", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("wbh_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("webhook_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/webhooks/{webhookID}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("webhooks"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "webhookID", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(120615523104) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("account_id") },
                                            .{ "orig", h.vstr("account_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("wbh_d193148ac2624de7b43a191682a8822f") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("webhook_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/api/v4/accounts/{accountId}/webhooks/{webhookID}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("api"),
                                    h.vstr("v4"),
                                    h.vstr("accounts"),
                                    h.vstr("{account_id}"),
                                    h.vstr("webhooks"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "accountId", h.vstr("account_id") },
                                        .{ "webhookID", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("account_id"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("account"),
                        }),
                    }) },
                }) },
            }) },
        }) },
    });
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "debug")) return @import("../feature/debug.zig").DebugFeature.make();
    if (std.mem.eql(u8, name, "idempotency")) return @import("../feature/idempotency.zig").IdempotencyFeature.make();
    if (std.mem.eql(u8, name, "log")) return @import("../feature/log.zig").LogFeature.make();
    if (std.mem.eql(u8, name, "metrics")) return @import("../feature/metrics.zig").MetricsFeature.make();
    if (std.mem.eql(u8, name, "netsim")) return @import("../feature/netsim.zig").NetsimFeature.make();
    if (std.mem.eql(u8, name, "paging")) return @import("../feature/paging.zig").PagingFeature.make();
    if (std.mem.eql(u8, name, "proxy")) return @import("../feature/proxy.zig").ProxyFeature.make();
    if (std.mem.eql(u8, name, "ratelimit")) return @import("../feature/ratelimit.zig").RatelimitFeature.make();
    if (std.mem.eql(u8, name, "rbac")) return @import("../feature/rbac.zig").RbacFeature.make();
    if (std.mem.eql(u8, name, "retry")) return @import("../feature/retry.zig").RetryFeature.make();
    if (std.mem.eql(u8, name, "streaming")) return @import("../feature/streaming.zig").StreamingFeature.make();
    if (std.mem.eql(u8, name, "telemetry")) return @import("../feature/telemetry.zig").TelemetryFeature.make();
    if (std.mem.eql(u8, name, "test")) return @import("../feature/test.zig").TestFeature.make();
    if (std.mem.eql(u8, name, "timeout")) return @import("../feature/timeout.zig").TimeoutFeature.make();
    return @import("../feature/base.zig").BaseFeature.make();
}
