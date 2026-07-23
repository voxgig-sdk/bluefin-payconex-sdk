# BluefinPayconex SDK configuration


def make_config():
    return {
        "main": {
            "name": "BluefinPayconex",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.payconex.net/",
            "auth": {
                "prefix": "Basic",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "account_updater": {},
                "account_updater_schedule": {},
                "account_updater_schedule_with_result": {},
                "account_updater_subscription_with_result": {},
                "account_updater_update": {},
                "api_key": {},
                "apple_pay_merchant_detail": {},
                "apple_pay_session": {},
                "dynamic_descriptor": {},
                "i_frame_create_instance": {},
                "i_frame_instance": {},
                "iframe": {},
                "init": {},
                "list_api_key_scopes_entry": {},
                "payment_iframe": {},
                "three_d_secure_auth": {},
                "three_d_secure_browser_init": {},
                "three_d_secure_status": {},
                "transaction_detail": {},
                "webhook": {},
            },
        },
        "entity": {
      "account_updater": {
        "fields": [],
        "name": "account_updater",
        "op": {
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "record_id",
                      "orig": "record_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 2,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}",
                "parts": [
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
                "rename": {
                  "param": {
                    "account": "account_id",
                    "recordId": "record_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "record_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
            ],
            "key$": "remove",
          },
        },
        "relations": {
          "ancestors": [
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
      "account_updater_schedule": {
        "fields": [
          {
            "active": True,
            "name": "enabled",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "period_date",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "period_id",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "response_format",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "token",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 4,
          },
        ],
        "name": "account_updater_schedule",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/account-updater/payconex/subscribe",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "payconex",
                  "subscribe",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "account_updater_schedule_with_result": {
        "fields": [
          {
            "active": True,
            "name": "card",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "created_at",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "enabled",
            "op": {
              "list": {
                "req": True,
                "type": "`$BOOLEAN`",
              },
            },
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "expiry",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "id",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "most_recent_update",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "period_date",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "period_id",
            "req": True,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "response_format",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "token",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "type",
            "req": True,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "updated_at",
            "req": True,
            "type": "`$STRING`",
            "index$": 11,
          },
        ],
        "name": "account_updater_schedule_with_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/account-updater/pan/subscribe",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "pan",
                  "subscribe",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "shieldconex",
                  "subscribe",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "schedule_id",
                      "orig": "schedule_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "schedules",
                  "{schedule_id}",
                  "results",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "scheduleId": "schedule_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "schedule_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [
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
      "account_updater_subscription_with_result": {
        "fields": [
          {
            "active": True,
            "name": "created_at",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "enabled",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "period_date",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "period_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "record",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "response_format",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "template_ref",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "updated_at",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
        ],
        "name": "account_updater_subscription_with_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                  "pan",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                  "payconex",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                  "shieldconex",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 2,
              },
            ],
            "key$": "create",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "css_42ffe2fd59e74d719970f1c966430323",
                      "kind": "param",
                      "name": "subscription_id",
                      "orig": "subscription_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "subscriptions",
                  "{subscription_id}",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "subscriptionId": "subscription_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "subscription_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "subscription",
            ],
          ],
        },
      },
      "account_updater_update": {
        "fields": [
          {
            "active": True,
            "name": "account_updater_schedule_record_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "format",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "new_expiry",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "new_token",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "old_expiry",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "old_token",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "recurring_schedule",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "update_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "updated_at",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
        ],
        "name": "account_updater_update",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "id",
                      "orig": "update_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{account}/account-updater/updates/{updateId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "account-updater",
                  "updates",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "account": "account_id",
                    "updateId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "api_key": {
        "fields": [
          {
            "active": True,
            "name": "account",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "enabled",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "expires_at",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "expires_in",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "label",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "method",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "scope",
            "op": {
              "create": {
                "req": True,
                "type": "`$ARRAY`",
              },
            },
            "req": False,
            "type": "`$ARRAY`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "secret",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
        ],
        "name": "api_key",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/api-keys",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "api-keys",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                  "query": [
                    {
                      "active": True,
                      "example": 25,
                      "kind": "query",
                      "name": "limit",
                      "orig": "limit",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "example": 5,
                      "kind": "query",
                      "name": "page",
                      "orig": "page",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "example": "words to search",
                      "kind": "query",
                      "name": "query",
                      "orig": "query",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/api-keys",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "api-keys",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "limit",
                    "page",
                    "query",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "api_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "resource_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "api-keys",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "resourceId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "api_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "resource_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "api-keys",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "resourceId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "remove",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "api_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "resource_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "api-keys",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "resourceId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "apple_pay_merchant_detail": {
        "fields": [
          {
            "active": True,
            "name": "domain",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "merchant_url",
            "op": {
              "create": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "partner_merchant_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "payconex_account_id",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
        ],
        "name": "apple_pay_merchant_detail",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/applePay/enrollment",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "applePay",
                  "enrollment",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/applePay/enrollment",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "applePay",
                  "enrollment",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "apple_pay_session": {
        "fields": [
          {
            "active": True,
            "name": "display_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "domain_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "epoch_timestamp",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "expires_at",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "merchant_identifier",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "merchant_session_identifier",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "nonce",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "operational_analytics_identifier",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "referrer",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "retry",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "signature",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
        ],
        "name": "apple_pay_session",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/applePay/session",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "applePay",
                  "session",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "dynamic_descriptor": {
        "fields": [
          {
            "active": True,
            "name": "city",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "descriptor",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "state",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
        "name": "dynamic_descriptor",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/dynamic_descriptors",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "dynamic_descriptors",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                  "query": [
                    {
                      "active": True,
                      "example": 25,
                      "kind": "query",
                      "name": "limit",
                      "orig": "limit",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "example": 5,
                      "kind": "query",
                      "name": "page",
                      "orig": "page",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "example": "words to search",
                      "kind": "query",
                      "name": "query",
                      "orig": "query",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/dynamic_descriptors",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "dynamic_descriptors",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "limit",
                    "page",
                    "query",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "dynamic_descriptors",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "dynamic_descriptors",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "remove",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 180000027666,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "dynamic_descriptors",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "i_frame_create_instance": {
        "fields": [
          {
            "active": True,
            "name": "amount",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "currency",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "customer",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "initialize_transaction",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "label",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "language",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "reference",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "timeout",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "token",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 8,
          },
        ],
        "name": "i_frame_create_instance",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                      "kind": "param",
                      "name": "payment_iframe_id",
                      "orig": "iframe_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                  "{payment_iframe_id}",
                  "instance",
                  "init",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "iframeId": "payment_iframe_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "payment_iframe_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "payment_iframe",
            ],
          ],
        },
      },
      "i_frame_instance": {
        "fields": [],
        "name": "i_frame_instance",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                      "kind": "param",
                      "name": "id",
                      "orig": "iframe_instance_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                    {
                      "active": True,
                      "example": "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
                      "kind": "param",
                      "name": "payment_iframe_id",
                      "orig": "iframe_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 2,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                  "{payment_iframe_id}",
                  "instance",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "iframeId": "payment_iframe_id",
                    "iframeInstanceId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                    "payment_iframe_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "payment_iframe",
            ],
          ],
        },
      },
      "iframe": {
        "fields": [
          {
            "active": True,
            "name": "ach_setting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "allowed_parent_domain",
            "op": {
              "list": {
                "req": False,
                "type": "`$ARRAY`",
              },
              "update": {
                "req": False,
                "type": "`$ARRAY`",
              },
            },
            "req": True,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "allowed_payment_method",
            "op": {
              "list": {
                "req": False,
                "type": "`$ARRAY`",
              },
              "update": {
                "req": False,
                "type": "`$ARRAY`",
              },
            },
            "req": True,
            "type": "`$ARRAY`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "card_setting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "click_to_pay_setting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "currency",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "label",
            "op": {
              "list": {
                "req": False,
                "type": "`$STRING`",
              },
              "update": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "language",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "timeout",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 9,
          },
        ],
        "name": "iframe",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ifr_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "iframe_id",
                      "orig": "iframe_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                  "{iframe_id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "iframeId": "iframe_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "iframe_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ifr_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "iframe_id",
                      "orig": "iframe_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                  "{iframe_id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "iframeId": "iframe_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "iframe_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
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
      "init": {
        "fields": [
          {
            "active": True,
            "name": "customer",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "item",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "level2",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "level3",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "shipping_address",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "trace",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 6,
          },
        ],
        "name": "init",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/payments/init",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payments",
                  "init",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "list_api_key_scopes_entry": {
        "fields": [
          {
            "active": True,
            "name": "category",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "enabled",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "level",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "scope",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
        "name": "list_api_key_scopes_entry",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/api/v4/api-key-scopes",
                "parts": [
                  "api",
                  "v4",
                  "api-key-scopes",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "payment_iframe": {
        "fields": [],
        "name": "payment_iframe",
        "op": {
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "ifr_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "iframe_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payment-iframe",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "iframeId": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "remove",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "three_d_secure_auth": {
        "fields": [
          {
            "active": True,
            "name": "browser",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "card",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "challenge",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "customer",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "purchase",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "server_transaction_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "shipping",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "three_d_secure_challenge_indicator",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "three_d_secure_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "trace",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 10,
          },
        ],
        "name": "three_d_secure_auth",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "tds_23d0e53de3c64e94887116da65abc8ce",
                      "kind": "param",
                      "name": "3_d_id",
                      "orig": "resource_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "3DS",
                  "{3_d_id}",
                  "browser-authenticate",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "resourceId": "3_d_id",
                  },
                },
                "select": {
                  "exist": [
                    "3_d_id",
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "3_d",
            ],
          ],
        },
      },
      "three_d_secure_browser_init": {
        "fields": [
          {
            "active": True,
            "name": "acs_result_url",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "acs_url",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "cvv",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "expiry",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "pan",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "payment_details_reference",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "server_transaction_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "three_d_secure_data",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "three_d_secure_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
        ],
        "name": "three_d_secure_browser_init",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/3DS/init-card-details",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "3DS",
                  "init-card-details",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
      "three_d_secure_status": {
        "fields": [
          {
            "active": True,
            "name": "error",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "info",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "server_transaction_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "three_d_secure",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "three_d_secure_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
        ],
        "name": "three_d_secure_status",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "tds_23d0e53de3c64e94887116da65abc8ce",
                      "kind": "param",
                      "name": "3_d_id",
                      "orig": "resource_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/3DS/{resourceId}/status",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "3DS",
                  "{3_d_id}",
                  "status",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "resourceId": "3_d_id",
                  },
                },
                "select": {
                  "exist": [
                    "3_d_id",
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "3_d",
            ],
          ],
        },
      },
      "transaction_detail": {
        "fields": [
          {
            "active": True,
            "name": "amount",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "auth",
            "req": True,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "card",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "customer",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "item",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "level2",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "level3",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "override",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "shipping_address",
            "op": {
              "update": {
                "req": False,
                "type": "`$OBJECT`",
              },
            },
            "req": True,
            "type": "`$OBJECT`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "status",
            "req": True,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "timestamp",
            "req": False,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "trace",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 13,
          },
        ],
        "name": "transaction_detail",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": 1861,
                      "kind": "param",
                      "name": "transaction_id",
                      "orig": "transaction_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/payments/{transactionId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payments",
                  "{transaction_id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "transactionId": "transaction_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "transaction_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": 1861,
                      "kind": "param",
                      "name": "transaction_id",
                      "orig": "transaction_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{accountId}/payments/{transactionId}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "payments",
                  "{transaction_id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "transactionId": "transaction_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "transaction_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
              "payment",
            ],
          ],
        },
      },
      "webhook": {
        "fields": [
          {
            "active": True,
            "name": "event",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "url",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "webhook",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "POST",
                "orig": "/api/v4/accounts/{accountId}/webhooks",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "webhooks",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "120615523104",
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/webhooks",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "webhooks",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "wbh_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "webhook_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "webhooks",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "webhookID": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "wbh_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "webhook_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "webhooks",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "webhookID": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "remove",
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 120615523104,
                      "kind": "param",
                      "name": "account_id",
                      "orig": "account_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "wbh_d193148ac2624de7b43a191682a8822f",
                      "kind": "param",
                      "name": "id",
                      "orig": "webhook_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "PATCH",
                "orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
                "parts": [
                  "api",
                  "v4",
                  "accounts",
                  "{account_id}",
                  "webhooks",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "accountId": "account_id",
                    "webhookID": "id",
                  },
                },
                "select": {
                  "exist": [
                    "account_id",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "update",
          },
        },
        "relations": {
          "ancestors": [
            [
              "account",
            ],
          ],
        },
      },
    },
    }
