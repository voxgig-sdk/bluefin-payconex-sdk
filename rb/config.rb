# BluefinPayconex SDK configuration

module BluefinPayconexConfig
  def self.make_config
    {
      "main" => {
        "name" => "BluefinPayconex",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.payconex.net/",
        "auth" => {
          "prefix" => "Basic",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "account_updater" => {},
          "account_updater_schedule" => {},
          "account_updater_schedule_with_result" => {},
          "account_updater_subscription_with_result" => {},
          "account_updater_update" => {},
          "api_key" => {},
          "apple_pay_merchant_detail" => {},
          "apple_pay_session" => {},
          "dynamic_descriptor" => {},
          "i_frame_create_instance" => {},
          "i_frame_instance" => {},
          "iframe" => {},
          "init" => {},
          "list_api_key_scopes_entry" => {},
          "payment_iframe" => {},
          "three_d_secure_auth" => {},
          "three_d_secure_browser_init" => {},
          "three_d_secure_status" => {},
          "transaction_detail" => {},
          "webhook" => {},
        },
      },
      "entity" => {
        "account_updater" => {
          "fields" => [],
          "name" => "account_updater",
          "op" => {
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "record_id",
                        "orig" => "record_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 2,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                    "records",
                    "{record_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "recordId" => "record_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "record_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
              ],
              "key$" => "remove",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "subscription",
              ],
              [
                "account",
                "subscription",
                "record",
              ],
            ],
          },
        },
        "account_updater_schedule" => {
          "fields" => [
            {
              "active" => true,
              "name" => "enabled",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "period_date",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "period_id",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "response_format",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "token",
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 4,
            },
          ],
          "name" => "account_updater_schedule",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/account-updater/payconex/subscribe",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "payconex",
                    "subscribe",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "account_updater_schedule_with_result" => {
          "fields" => [
            {
              "active" => true,
              "name" => "card",
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "created_at",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "enabled",
              "op" => {
                "list" => {
                  "req" => true,
                  "type" => "`$BOOLEAN`",
                },
              },
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "expiry",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "most_recent_update",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "period_date",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "period_id",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "response_format",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "token",
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "type",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 10,
            },
            {
              "active" => true,
              "name" => "updated_at",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 11,
            },
          ],
          "name" => "account_updater_schedule_with_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/account-updater/pan/subscribe",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "pan",
                    "subscribe",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "shieldconex",
                    "subscribe",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "schedule_id",
                        "orig" => "schedule_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "schedules",
                    "{schedule_id}",
                    "results",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "scheduleId" => "schedule_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "schedule_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
              [
                "account",
                "schedule",
              ],
            ],
          },
        },
        "account_updater_subscription_with_result" => {
          "fields" => [
            {
              "active" => true,
              "name" => "created_at",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "enabled",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "period_date",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "period_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "record",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "response_format",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "template_ref",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "updated_at",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
          ],
          "name" => "account_updater_subscription_with_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                    "pan",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                    "payconex",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                    "shieldconex",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 2,
                },
              ],
              "key$" => "create",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "css_42ffe2fd59e74d719970f1c966430323",
                        "kind" => "param",
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "subscriptionId" => "subscription_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "subscription",
              ],
            ],
          },
        },
        "account_updater_update" => {
          "fields" => [
            {
              "active" => true,
              "name" => "account_updater_schedule_record_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "format",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "new_expiry",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "new_token",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "old_expiry",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "old_token",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "recurring_schedule",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "status",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "update_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "updated_at",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 10,
            },
          ],
          "name" => "account_updater_update",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "update_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{account}/account-updater/updates/{updateId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "account-updater",
                    "updates",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "account" => "account_id",
                      "updateId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "api_key" => {
          "fields" => [
            {
              "active" => true,
              "name" => "account",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "enabled",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "expires_at",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "expires_in",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "label",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
              },
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "method",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "scope",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$ARRAY`",
                },
              },
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "secret",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
          ],
          "name" => "api_key",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/api-keys",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "api-keys",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                    "query" => [
                      {
                        "active" => true,
                        "example" => 25,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "example" => 5,
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "example" => "words to search",
                        "kind" => "query",
                        "name" => "query",
                        "orig" => "query",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/api-keys",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "api-keys",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "limit",
                      "page",
                      "query",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "api_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "resource_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "api-keys",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "resourceId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "api_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "resource_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "api-keys",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "resourceId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "remove",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "api_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "resource_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "api-keys",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "resourceId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "apple_pay_merchant_detail" => {
          "fields" => [
            {
              "active" => true,
              "name" => "domain",
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "merchant_url",
              "op" => {
                "create" => {
                  "req" => false,
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "partner_merchant_name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "payconex_account_id",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 3,
            },
          ],
          "name" => "apple_pay_merchant_detail",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/applePay/enrollment",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "applePay",
                    "enrollment",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/applePay/enrollment",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "applePay",
                    "enrollment",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "apple_pay_session" => {
          "fields" => [
            {
              "active" => true,
              "name" => "display_name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "domain_name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "epoch_timestamp",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "expires_at",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "merchant_identifier",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "merchant_session_identifier",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "nonce",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "operational_analytics_identifier",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "referrer",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "retry",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "signature",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 10,
            },
          ],
          "name" => "apple_pay_session",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/applePay/session",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "applePay",
                    "session",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "dynamic_descriptor" => {
          "fields" => [
            {
              "active" => true,
              "name" => "city",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "descriptor",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "state",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
          ],
          "name" => "dynamic_descriptor",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/dynamic_descriptors",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "dynamic_descriptors",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                    "query" => [
                      {
                        "active" => true,
                        "example" => 25,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "example" => 5,
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "example" => "words to search",
                        "kind" => "query",
                        "name" => "query",
                        "orig" => "query",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/dynamic_descriptors",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "dynamic_descriptors",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "limit",
                      "page",
                      "query",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ddesc_1669911404412ae74cd5eef8f463495d6b",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "dynamic_descriptors",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ddesc_1669911404412ae74cd5eef8f463495d6b",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "dynamic_descriptors",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "remove",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 180000027666,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ddesc_1669911404412ae74cd5eef8f463495d6b",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "dynamic_descriptors",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "i_frame_create_instance" => {
          "fields" => [
            {
              "active" => true,
              "name" => "amount",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "currency",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "customer",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "initialize_transaction",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "label",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "language",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "reference",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "timeout",
              "req" => false,
              "type" => "`$NUMBER`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "token",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 8,
            },
          ],
          "name" => "i_frame_create_instance",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                        "kind" => "param",
                        "name" => "payment_iframe_id",
                        "orig" => "iframe_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                    "{payment_iframe_id}",
                    "instance",
                    "init",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "iframeId" => "payment_iframe_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "payment_iframe_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "payment_iframe",
              ],
            ],
          },
        },
        "i_frame_instance" => {
          "fields" => [],
          "name" => "i_frame_instance",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "iframe_instance_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                      {
                        "active" => true,
                        "example" => "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                        "kind" => "param",
                        "name" => "payment_iframe_id",
                        "orig" => "iframe_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 2,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                    "{payment_iframe_id}",
                    "instance",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "iframeId" => "payment_iframe_id",
                      "iframeInstanceId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                      "payment_iframe_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "payment_iframe",
              ],
            ],
          },
        },
        "iframe" => {
          "fields" => [
            {
              "active" => true,
              "name" => "ach_setting",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "allowed_parent_domain",
              "op" => {
                "list" => {
                  "req" => false,
                  "type" => "`$ARRAY`",
                },
                "update" => {
                  "req" => false,
                  "type" => "`$ARRAY`",
                },
              },
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "allowed_payment_method",
              "op" => {
                "list" => {
                  "req" => false,
                  "type" => "`$ARRAY`",
                },
                "update" => {
                  "req" => false,
                  "type" => "`$ARRAY`",
                },
              },
              "req" => true,
              "type" => "`$ARRAY`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "card_setting",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "click_to_pay_setting",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "currency",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "label",
              "op" => {
                "list" => {
                  "req" => false,
                  "type" => "`$STRING`",
                },
                "update" => {
                  "req" => false,
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "language",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "timeout",
              "req" => false,
              "type" => "`$NUMBER`",
              "index$" => 9,
            },
          ],
          "name" => "iframe",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ifr_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "iframe_id",
                        "orig" => "iframe_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                    "{iframe_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "iframeId" => "iframe_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "iframe_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ifr_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "iframe_id",
                        "orig" => "iframe_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                    "{iframe_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "iframeId" => "iframe_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "iframe_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
              [
                "account",
                "payment_iframe",
              ],
            ],
          },
        },
        "init" => {
          "fields" => [
            {
              "active" => true,
              "name" => "customer",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "description",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "item",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "level2",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "level3",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "shipping_address",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "trace",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 6,
            },
          ],
          "name" => "init",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/payments/init",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payments",
                    "init",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "list_api_key_scopes_entry" => {
          "fields" => [
            {
              "active" => true,
              "name" => "category",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "description",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "enabled",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "level",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "scope",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
          ],
          "name" => "list_api_key_scopes_entry",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/api/v4/api-key-scopes",
                  "parts" => [
                    "api",
                    "v4",
                    "api-key-scopes",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "payment_iframe" => {
          "fields" => [],
          "name" => "payment_iframe",
          "op" => {
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "ifr_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "iframe_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payment-iframe",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "iframeId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "remove",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "three_d_secure_auth" => {
          "fields" => [
            {
              "active" => true,
              "name" => "browser",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "card",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "challenge",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "customer",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "purchase",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "server_transaction_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "shipping",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "status",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "three_d_secure_challenge_indicator",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "three_d_secure_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "trace",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 10,
            },
          ],
          "name" => "three_d_secure_auth",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "tds_23d0e53de3c64e94887116da65abc8ce",
                        "kind" => "param",
                        "name" => "3_d_id",
                        "orig" => "resource_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "3DS",
                    "{3_d_id}",
                    "browser-authenticate",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "resourceId" => "3_d_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "3_d_id",
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "3_d",
              ],
            ],
          },
        },
        "three_d_secure_browser_init" => {
          "fields" => [
            {
              "active" => true,
              "name" => "acs_result_url",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "acs_url",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "cvv",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "expiry",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "pan",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "payment_details_reference",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "server_transaction_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "status",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "three_d_secure_data",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "three_d_secure_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
          ],
          "name" => "three_d_secure_browser_init",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/3DS/init-card-details",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "3DS",
                    "init-card-details",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
        "three_d_secure_status" => {
          "fields" => [
            {
              "active" => true,
              "name" => "error",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "info",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "server_transaction_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "status",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "three_d_secure",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "three_d_secure_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
          ],
          "name" => "three_d_secure_status",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "tds_23d0e53de3c64e94887116da65abc8ce",
                        "kind" => "param",
                        "name" => "3_d_id",
                        "orig" => "resource_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/3DS/{resourceId}/status",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "3DS",
                    "{3_d_id}",
                    "status",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "resourceId" => "3_d_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "3_d_id",
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "3_d",
              ],
            ],
          },
        },
        "transaction_detail" => {
          "fields" => [
            {
              "active" => true,
              "name" => "amount",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "auth",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "card",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "customer",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "description",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "item",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "level2",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "level3",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "override",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "shipping_address",
              "op" => {
                "update" => {
                  "req" => false,
                  "type" => "`$OBJECT`",
                },
              },
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 10,
            },
            {
              "active" => true,
              "name" => "status",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 11,
            },
            {
              "active" => true,
              "name" => "timestamp",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 12,
            },
            {
              "active" => true,
              "name" => "trace",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 13,
            },
          ],
          "name" => "transaction_detail",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => 1861,
                        "kind" => "param",
                        "name" => "transaction_id",
                        "orig" => "transaction_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/payments/{transactionId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payments",
                    "{transaction_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "transactionId" => "transaction_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "transaction_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => 1861,
                        "kind" => "param",
                        "name" => "transaction_id",
                        "orig" => "transaction_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{accountId}/payments/{transactionId}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "payments",
                    "{transaction_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "transactionId" => "transaction_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "transaction_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
                "payment",
              ],
            ],
          },
        },
        "webhook" => {
          "fields" => [
            {
              "active" => true,
              "name" => "event",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "url",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 2,
            },
          ],
          "name" => "webhook",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "POST",
                  "orig" => "/api/v4/accounts/{accountId}/webhooks",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "webhooks",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "120615523104",
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/webhooks",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "webhooks",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "wbh_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "webhook_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "webhooks",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "webhookID" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "wbh_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "webhook_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "DELETE",
                  "orig" => "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "webhooks",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "webhookID" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "remove",
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 120615523104,
                        "kind" => "param",
                        "name" => "account_id",
                        "orig" => "account_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                      {
                        "active" => true,
                        "example" => "wbh_d193148ac2624de7b43a191682a8822f",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "webhook_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 1,
                      },
                    ],
                  },
                  "method" => "PATCH",
                  "orig" => "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                  "parts" => [
                    "api",
                    "v4",
                    "accounts",
                    "{account_id}",
                    "webhooks",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "accountId" => "account_id",
                      "webhookID" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "update",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "account",
              ],
            ],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BluefinPayconexFeatures.make_feature(name)
  end
end
