(* Generated API configuration (mirrors go core/config.go).
 *
 * make_config () — the embedded API model as a voxgig struct value.
 * make_feature name — the N-feature-safe factory the client uses. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Sdk_features

let make_config () : value =
  (jo [
    ("main", (jo [
      ("name", (Str "BluefinPayconex")) ]));
    ("feature", (jo [
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ])) ])) ]));
    ("options", (jo [
      ("base", (Str "https://api.payconex.net/"));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("account_updater", (empty_map ()));
        ("account_updater_schedule", (empty_map ()));
        ("account_updater_schedule_with_result", (empty_map ()));
        ("account_updater_subscription_with_result", (empty_map ()));
        ("account_updater_update", (empty_map ()));
        ("api_key", (empty_map ()));
        ("apple_pay_merchant_detail", (empty_map ()));
        ("apple_pay_session", (empty_map ()));
        ("dynamic_descriptor", (empty_map ()));
        ("i_frame_create_instance", (empty_map ()));
        ("i_frame_instance", (empty_map ()));
        ("iframe", (empty_map ()));
        ("init", (empty_map ()));
        ("list_api_key_scopes_entry", (empty_map ()));
        ("payment_iframe", (empty_map ()));
        ("three_d_secure_auth", (empty_map ()));
        ("three_d_secure_browser_init", (empty_map ()));
        ("three_d_secure_status", (empty_map ()));
        ("transaction_detail", (empty_map ()));
        ("webhook", (empty_map ())) ]));
      ("auth", (jo [
        ("prefix", (Str "Basic")) ])) ]));
    ("entity", (jo [
      ("account_updater", (jo [
        ("fields", (empty_list ()));
        ("name", (Str "account_updater"));
        ("op", (jo [
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "record_id"));
                      ("orig", (Str "record_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (2.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}");
                  (Str "records");
                  (Str "{record_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("recordId", (Str "record_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "record_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "subscription") ]);
            (ja [
              (Str "account");
              (Str "subscription");
              (Str "record") ]) ])) ])) ]));
      ("account_updater_schedule", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "enabled"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_id"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "response_format"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "token"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (4.))) ]) ]));
        ("name", (Str "account_updater_schedule"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/account-updater/payconex/subscribe"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "payconex");
                  (Str "subscribe") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("account_updater_schedule_with_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "card"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created_at"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "enabled"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$BOOLEAN`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expiry"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "most_recent_update"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_id"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "response_format"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "token"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "type"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "updated_at"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]) ]));
        ("name", (Str "account_updater_schedule_with_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/account-updater/pan/subscribe"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "pan");
                  (Str "subscribe") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "shieldconex");
                  (Str "subscribe") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "schedule_id"));
                      ("orig", (Str "schedule_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "schedules");
                  (Str "{schedule_id}");
                  (Str "results") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("scheduleId", (Str "schedule_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "schedule_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]);
            (ja [
              (Str "account");
              (Str "schedule") ]) ])) ])) ]));
      ("account_updater_subscription_with_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "created_at"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "enabled"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "period_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "record"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "response_format"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "template_ref"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "updated_at"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]) ]));
        ("name", (Str "account_updater_subscription_with_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}");
                  (Str "pan") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}");
                  (Str "payconex") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}");
                  (Str "shieldconex") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (2.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "css_42ffe2fd59e74d719970f1c966430323"));
                      ("kind", (Str "param"));
                      ("name", (Str "subscription_id"));
                      ("orig", (Str "subscription_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "subscriptions");
                  (Str "{subscription_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("subscriptionId", (Str "subscription_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "subscription_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "subscription") ]) ])) ])) ]));
      ("account_updater_update", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "account_updater_schedule_record_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "format"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "new_expiry"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "new_token"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "old_expiry"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "old_token"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "recurring_schedule"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "update_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "updated_at"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "account_updater_update"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "update_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{account}/account-updater/updates/{updateId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "account-updater");
                  (Str "updates");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("account", (Str "account_id"));
                    ("updateId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("api_key", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "account"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "enabled"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expires_at"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expires_in"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "label"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "method"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "scope"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$ARRAY`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "secret"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]) ]));
        ("name", (Str "api_key"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/api-keys"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "api-keys") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (25.)));
                      ("kind", (Str "query"));
                      ("name", (Str "limit"));
                      ("orig", (Str "limit"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (5.)));
                      ("kind", (Str "query"));
                      ("name", (Str "page"));
                      ("orig", (Str "page"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "words to search"));
                      ("kind", (Str "query"));
                      ("name", (Str "query"));
                      ("orig", (Str "query"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/api-keys"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "api-keys") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "limit");
                    (Str "page");
                    (Str "query") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "api_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "resource_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/api-keys/{resourceId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "api-keys");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("resourceId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "api_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "resource_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{accountId}/api-keys/{resourceId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "api-keys");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("resourceId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "api_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "resource_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{accountId}/api-keys/{resourceId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "api-keys");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("resourceId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("apple_pay_merchant_detail", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "domain"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "merchant_url"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner_merchant_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "payconex_account_id"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]) ]));
        ("name", (Str "apple_pay_merchant_detail"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/applePay/enrollment"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "applePay");
                  (Str "enrollment") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/applePay/enrollment"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "applePay");
                  (Str "enrollment") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("apple_pay_session", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "display_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "domain_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "epoch_timestamp"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expires_at"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "merchant_identifier"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "merchant_session_identifier"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "nonce"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "operational_analytics_identifier"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "referrer"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "retry"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "signature"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "apple_pay_session"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$INTEGER`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/applePay/session"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "applePay");
                  (Str "session") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("dynamic_descriptor", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "city"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "descriptor"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "state"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]) ]));
        ("name", (Str "dynamic_descriptor"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/dynamic_descriptors"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "dynamic_descriptors") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (25.)));
                      ("kind", (Str "query"));
                      ("name", (Str "limit"));
                      ("orig", (Str "limit"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (5.)));
                      ("kind", (Str "query"));
                      ("name", (Str "page"));
                      ("orig", (Str "page"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "words to search"));
                      ("kind", (Str "query"));
                      ("name", (Str "query"));
                      ("orig", (Str "query"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/dynamic_descriptors"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "dynamic_descriptors") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "limit");
                    (Str "page");
                    (Str "query") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ddesc_1669911404412ae74cd5eef8f463495d6b"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "dynamic_descriptors");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ddesc_1669911404412ae74cd5eef8f463495d6b"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "dynamic_descriptors");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (180000027666.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ddesc_1669911404412ae74cd5eef8f463495d6b"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "dynamic_descriptors");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("i_frame_create_instance", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "amount"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "currency"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "customer"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "initialize_transaction"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "label"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "language"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "timeout"));
            ("req", (Bool false));
            ("type", (Str "`$NUMBER`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "token"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (8.))) ]) ]));
        ("name", (Str "i_frame_create_instance"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9"));
                      ("kind", (Str "param"));
                      ("name", (Str "payment_iframe_id"));
                      ("orig", (Str "iframe_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe");
                  (Str "{payment_iframe_id}");
                  (Str "instance");
                  (Str "init") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("iframeId", (Str "payment_iframe_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "payment_iframe_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "payment_iframe") ]) ])) ])) ]));
      ("i_frame_instance", (jo [
        ("fields", (empty_list ()));
        ("name", (Str "i_frame_instance"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "iframe_instance_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9"));
                      ("kind", (Str "param"));
                      ("name", (Str "payment_iframe_id"));
                      ("orig", (Str "iframe_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (2.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe");
                  (Str "{payment_iframe_id}");
                  (Str "instance");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("iframeId", (Str "payment_iframe_id"));
                    ("iframeInstanceId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id");
                    (Str "payment_iframe_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "payment_iframe") ]) ])) ])) ]));
      ("iframe", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "ach_setting"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "allowed_parent_domain"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$ARRAY`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$ARRAY`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "allowed_payment_method"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$ARRAY`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$ARRAY`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "card_setting"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "click_to_pay_setting"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "currency"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "label"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "language"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "timeout"));
            ("req", (Bool false));
            ("type", (Str "`$NUMBER`"));
            ("index$", (Num (9.))) ]) ]));
        ("name", (Str "iframe"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifr_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "iframe_id"));
                      ("orig", (Str "iframe_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe");
                  (Str "{iframe_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("iframeId", (Str "iframe_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "iframe_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifr_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "iframe_id"));
                      ("orig", (Str "iframe_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe");
                  (Str "{iframe_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("iframeId", (Str "iframe_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "iframe_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]);
            (ja [
              (Str "account");
              (Str "payment_iframe") ]) ])) ])) ]));
      ("init", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "customer"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "description"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "item"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "level2"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "level3"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "shipping_address"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "trace"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]) ]));
        ("name", (Str "init"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payments/init"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payments");
                  (Str "init") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("list_api_key_scopes_entry", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "category"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "description"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "enabled"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "level"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "scope"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]) ]));
        ("name", (Str "list_api_key_scopes_entry"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/api-key-scopes"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "api-key-scopes") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("payment_iframe", (jo [
        ("fields", (empty_list ()));
        ("name", (Str "payment_iframe"));
        ("op", (jo [
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "ifr_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "iframe_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payment-iframe");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("iframeId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("three_d_secure_auth", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "browser"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "card"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "challenge"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "customer"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "purchase"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "server_transaction_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "shipping"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure_challenge_indicator"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "trace"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "three_d_secure_auth"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "tds_23d0e53de3c64e94887116da65abc8ce"));
                      ("kind", (Str "param"));
                      ("name", (Str "3_d_id"));
                      ("orig", (Str "resource_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "3DS");
                  (Str "{3_d_id}");
                  (Str "browser-authenticate") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("resourceId", (Str "3_d_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "3_d_id");
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "3_d") ]) ])) ])) ]));
      ("three_d_secure_browser_init", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "acs_result_url"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "acs_url"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "cvv"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expiry"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "pan"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "payment_details_reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "server_transaction_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure_data"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]) ]));
        ("name", (Str "three_d_secure_browser_init"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/3DS/init-card-details"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "3DS");
                  (Str "init-card-details") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ]));
      ("three_d_secure_status", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "error"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "info"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "server_transaction_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "three_d_secure_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]) ]));
        ("name", (Str "three_d_secure_status"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "tds_23d0e53de3c64e94887116da65abc8ce"));
                      ("kind", (Str "param"));
                      ("name", (Str "3_d_id"));
                      ("orig", (Str "resource_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/3DS/{resourceId}/status"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "3DS");
                  (Str "{3_d_id}");
                  (Str "status") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("resourceId", (Str "3_d_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "3_d_id");
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "3_d") ]) ])) ])) ]));
      ("transaction_detail", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "amount"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "auth"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "card"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "customer"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "description"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "item"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "level2"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "level3"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "override"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "shipping_address"));
            ("op", (jo [
              ("update", (jo [
                ("req", (Bool false));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "timestamp"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "trace"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (13.))) ]) ]));
        ("name", (Str "transaction_detail"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (1861.)));
                      ("kind", (Str "param"));
                      ("name", (Str "transaction_id"));
                      ("orig", (Str "transaction_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payments/{transactionId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payments");
                  (Str "{transaction_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("transactionId", (Str "transaction_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "transaction_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (1861.)));
                      ("kind", (Str "param"));
                      ("name", (Str "transaction_id"));
                      ("orig", (Str "transaction_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{accountId}/payments/{transactionId}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "payments");
                  (Str "{transaction_id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("transactionId", (Str "transaction_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "transaction_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account");
              (Str "payment") ]) ])) ])) ]));
      ("webhook", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "event"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "url"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]) ]));
        ("name", (Str "webhook"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/api/v4/accounts/{accountId}/webhooks"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "webhooks") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "120615523104"));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/webhooks"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "webhooks") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "wbh_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "webhook_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "GET"));
                ("orig", (Str "/api/v4/accounts/{accountId}/webhooks/{webhookID}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "webhooks");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("webhookID", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "wbh_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "webhook_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "DELETE"));
                ("orig", (Str "/api/v4/accounts/{accountId}/webhooks/{webhookID}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "webhooks");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("webhookID", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (120615523104.)));
                      ("kind", (Str "param"));
                      ("name", (Str "account_id"));
                      ("orig", (Str "account_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "wbh_d193148ac2624de7b43a191682a8822f"));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "webhook_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
                ("method", (Str "PATCH"));
                ("orig", (Str "/api/v4/accounts/{accountId}/webhooks/{webhookID}"));
                ("parts", (ja [
                  (Str "api");
                  (Str "v4");
                  (Str "accounts");
                  (Str "{account_id}");
                  (Str "webhooks");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("accountId", (Str "account_id"));
                    ("webhookID", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "account_id");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "account") ]) ])) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
