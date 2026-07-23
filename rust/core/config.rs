// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinPayconex")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://api.payconex.net/")),
            ("headers".to_string(), Value::map_of([
                ("content-type".to_string(), Value::str("application/json")),
            ])),
            ("entity".to_string(), Value::map_of([
                ("account_updater".to_string(), Value::empty_map()),
                ("account_updater_schedule".to_string(), Value::empty_map()),
                ("account_updater_schedule_with_result".to_string(), Value::empty_map()),
                ("account_updater_subscription_with_result".to_string(), Value::empty_map()),
                ("account_updater_update".to_string(), Value::empty_map()),
                ("api_key".to_string(), Value::empty_map()),
                ("apple_pay_merchant_detail".to_string(), Value::empty_map()),
                ("apple_pay_session".to_string(), Value::empty_map()),
                ("dynamic_descriptor".to_string(), Value::empty_map()),
                ("i_frame_create_instance".to_string(), Value::empty_map()),
                ("i_frame_instance".to_string(), Value::empty_map()),
                ("iframe".to_string(), Value::empty_map()),
                ("init".to_string(), Value::empty_map()),
                ("list_api_key_scopes_entry".to_string(), Value::empty_map()),
                ("payment_iframe".to_string(), Value::empty_map()),
                ("three_d_secure_auth".to_string(), Value::empty_map()),
                ("three_d_secure_browser_init".to_string(), Value::empty_map()),
                ("three_d_secure_status".to_string(), Value::empty_map()),
                ("transaction_detail".to_string(), Value::empty_map()),
                ("webhook".to_string(), Value::empty_map()),
            ])),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("account_updater".to_string(), Value::map_of([
                ("fields".to_string(), Value::empty_list()),
                ("name".to_string(), Value::str("account_updater")),
                ("op".to_string(), Value::map_of([
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("record_id")),
                                            ("orig".to_string(), Value::str("record_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(2f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                    Value::str("records"),
                                    Value::str("{record_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("recordId".to_string(), Value::str("record_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("record_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("subscription"),
                        ]),
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("subscription"),
                            Value::str("record"),
                        ]),
                    ])),
                ])),
            ])),
            ("account_updater_schedule".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("enabled")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_date")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_id")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_format")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("token")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("account_updater_schedule")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/account-updater/payconex/subscribe")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("payconex"),
                                    Value::str("subscribe"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("account_updater_schedule_with_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("card")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created_at")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("enabled")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$BOOLEAN`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expiry")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("most_recent_update")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_date")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_id")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_format")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("token")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("type")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("updated_at")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("account_updater_schedule_with_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/account-updater/pan/subscribe")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("pan"),
                                    Value::str("subscribe"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("shieldconex"),
                                    Value::str("subscribe"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("schedule_id")),
                                            ("orig".to_string(), Value::str("schedule_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("schedules"),
                                    Value::str("{schedule_id}"),
                                    Value::str("results"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("scheduleId".to_string(), Value::str("schedule_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("schedule_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("schedule"),
                        ]),
                    ])),
                ])),
            ])),
            ("account_updater_subscription_with_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created_at")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("enabled")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_date")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("period_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("record")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_format")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("template_ref")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("updated_at")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("account_updater_subscription_with_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                    Value::str("pan"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                    Value::str("payconex"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                    Value::str("shieldconex"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("css_42ffe2fd59e74d719970f1c966430323")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("subscription_id")),
                                            ("orig".to_string(), Value::str("subscription_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("subscriptions"),
                                    Value::str("{subscription_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("subscriptionId".to_string(), Value::str("subscription_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("subscription_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("subscription"),
                        ]),
                    ])),
                ])),
            ])),
            ("account_updater_update".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("account_updater_schedule_record_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("format")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("new_expiry")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("new_token")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("old_expiry")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("old_token")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("recurring_schedule")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("update_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("updated_at")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("account_updater_update")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("update_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{account}/account-updater/updates/{updateId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("account-updater"),
                                    Value::str("updates"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("account".to_string(), Value::str("account_id")),
                                        ("updateId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("api_key".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("account")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("enabled")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expires_at")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expires_in")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("label")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("method")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("scope")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$ARRAY`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("secret")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("api_key")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/api-keys")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("api-keys"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(25f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("limit")),
                                            ("orig".to_string(), Value::str("limit")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(5f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("page")),
                                            ("orig".to_string(), Value::str("page")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("words to search")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("query")),
                                            ("orig".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/api-keys")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("api-keys"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("limit"),
                                        Value::str("page"),
                                        Value::str("query"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("api_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("resource_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/api-keys/{resourceId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("api-keys"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("resourceId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("api_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("resource_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/api-keys/{resourceId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("api-keys"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("resourceId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("api_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("resource_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/api-keys/{resourceId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("api-keys"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("resourceId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("apple_pay_merchant_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("domain")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_url")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner_merchant_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("payconex_account_id")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("apple_pay_merchant_detail")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/applePay/enrollment")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("applePay"),
                                    Value::str("enrollment"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/applePay/enrollment")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("applePay"),
                                    Value::str("enrollment"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("apple_pay_session".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("display_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("domain_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("epoch_timestamp")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expires_at")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_identifier")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_session_identifier")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("nonce")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("operational_analytics_identifier")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("referrer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("retry")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("signature")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("apple_pay_session")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/applePay/session")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("applePay"),
                                    Value::str("session"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("dynamic_descriptor".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("city")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("descriptor")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("state")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("dynamic_descriptor")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/dynamic_descriptors")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("dynamic_descriptors"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(25f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("limit")),
                                            ("orig".to_string(), Value::str("limit")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(5f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("page")),
                                            ("orig".to_string(), Value::str("page")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("words to search")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("query")),
                                            ("orig".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/dynamic_descriptors")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("dynamic_descriptors"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("limit"),
                                        Value::str("page"),
                                        Value::str("query"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ddesc_1669911404412ae74cd5eef8f463495d6b")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("dynamic_descriptors"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ddesc_1669911404412ae74cd5eef8f463495d6b")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("dynamic_descriptors"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(180000027666f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ddesc_1669911404412ae74cd5eef8f463495d6b")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/dynamic_descriptors/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("dynamic_descriptors"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("i_frame_create_instance".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("amount")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("customer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("initialize_transaction")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("label")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reference")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("timeout")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$NUMBER`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("token")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("i_frame_create_instance")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("payment_iframe_id")),
                                            ("orig".to_string(), Value::str("iframe_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                    Value::str("{payment_iframe_id}"),
                                    Value::str("instance"),
                                    Value::str("init"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("iframeId".to_string(), Value::str("payment_iframe_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("payment_iframe_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("payment_iframe"),
                        ]),
                    ])),
                ])),
            ])),
            ("i_frame_instance".to_string(), Value::map_of([
                ("fields".to_string(), Value::empty_list()),
                ("name".to_string(), Value::str("i_frame_instance")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("iframe_instance_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("payment_iframe_id")),
                                            ("orig".to_string(), Value::str("iframe_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(2f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                    Value::str("{payment_iframe_id}"),
                                    Value::str("instance"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("iframeId".to_string(), Value::str("payment_iframe_id")),
                                        ("iframeInstanceId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                        Value::str("payment_iframe_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("payment_iframe"),
                        ]),
                    ])),
                ])),
            ])),
            ("iframe".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("ach_setting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("allowed_parent_domain")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$ARRAY`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$ARRAY`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("allowed_payment_method")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$ARRAY`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$ARRAY`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("card_setting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("click_to_pay_setting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("label")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                            ("update".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("timeout")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$NUMBER`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("iframe")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifr_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("iframe_id")),
                                            ("orig".to_string(), Value::str("iframe_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                    Value::str("{iframe_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("iframeId".to_string(), Value::str("iframe_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("iframe_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifr_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("iframe_id")),
                                            ("orig".to_string(), Value::str("iframe_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                    Value::str("{iframe_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("iframeId".to_string(), Value::str("iframe_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("iframe_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("payment_iframe"),
                        ]),
                    ])),
                ])),
            ])),
            ("init".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("customer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("item")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("level2")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("level3")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("shipping_address")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("trace")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("init")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payments/init")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payments"),
                                    Value::str("init"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("list_api_key_scopes_entry".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("category")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("enabled")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("level")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("scope")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("list_api_key_scopes_entry")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/api-key-scopes")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("api-key-scopes"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("payment_iframe".to_string(), Value::map_of([
                ("fields".to_string(), Value::empty_list()),
                ("name".to_string(), Value::str("payment_iframe")),
                ("op".to_string(), Value::map_of([
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("ifr_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("iframe_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payment-iframe/{iframeId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payment-iframe"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("iframeId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("three_d_secure_auth".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("browser")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("card")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("challenge")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("customer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("purchase")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("server_transaction_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("shipping")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure_challenge_indicator")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("trace")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("three_d_secure_auth")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("tds_23d0e53de3c64e94887116da65abc8ce")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("3_d_id")),
                                            ("orig".to_string(), Value::str("resource_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("3DS"),
                                    Value::str("{3_d_id}"),
                                    Value::str("browser-authenticate"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("resourceId".to_string(), Value::str("3_d_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("3_d_id"),
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("3_d"),
                        ]),
                    ])),
                ])),
            ])),
            ("three_d_secure_browser_init".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("acs_result_url")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("acs_url")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("cvv")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expiry")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("pan")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("payment_details_reference")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("server_transaction_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure_data")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("three_d_secure_browser_init")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/3DS/init-card-details")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("3DS"),
                                    Value::str("init-card-details"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
            ("three_d_secure_status".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("error")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("info")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("server_transaction_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("three_d_secure_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("three_d_secure_status")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("tds_23d0e53de3c64e94887116da65abc8ce")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("3_d_id")),
                                            ("orig".to_string(), Value::str("resource_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/3DS/{resourceId}/status")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("3DS"),
                                    Value::str("{3_d_id}"),
                                    Value::str("status"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("resourceId".to_string(), Value::str("3_d_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("3_d_id"),
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("3_d"),
                        ]),
                    ])),
                ])),
            ])),
            ("transaction_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("amount")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("auth")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("card")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("customer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("item")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("level2")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("level3")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("override")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("shipping_address")),
                        ("op".to_string(), Value::map_of([
                            ("update".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("timestamp")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("trace")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("transaction_detail")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(1861f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("transaction_id")),
                                            ("orig".to_string(), Value::str("transaction_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payments/{transactionId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payments"),
                                    Value::str("{transaction_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("transactionId".to_string(), Value::str("transaction_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("transaction_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(1861f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("transaction_id")),
                                            ("orig".to_string(), Value::str("transaction_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/payments/{transactionId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("payments"),
                                    Value::str("{transaction_id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("transactionId".to_string(), Value::str("transaction_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("transaction_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                            Value::str("payment"),
                        ]),
                    ])),
                ])),
            ])),
            ("webhook".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("event")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("url")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("webhook")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/webhooks")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("webhooks"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("120615523104")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/webhooks")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("webhooks"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("wbh_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("webhook_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/webhooks/{webhookID}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("webhooks"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("webhookID".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("wbh_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("webhook_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/webhooks/{webhookID}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("webhooks"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("webhookID".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(120615523104f64)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("account_id")),
                                            ("orig".to_string(), Value::str("account_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("wbh_d193148ac2624de7b43a191682a8822f")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("webhook_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/api/v4/accounts/{accountId}/webhooks/{webhookID}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("api"),
                                    Value::str("v4"),
                                    Value::str("accounts"),
                                    Value::str("{account_id}"),
                                    Value::str("webhooks"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("accountId".to_string(), Value::str("account_id")),
                                        ("webhookID".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("account_id"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("account"),
                        ]),
                    ])),
                ])),
            ])),
        ])),
    ])
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
