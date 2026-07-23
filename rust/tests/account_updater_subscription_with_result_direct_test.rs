// Generated direct-call tests for the account_updater_subscription_with_result entity (mirrors the
// go TestDirect generator; the live-mode path uses idmap-provided IDs).

#![allow(unused_variables, unused_imports, dead_code)]

mod common;

use std::cell::RefCell;
use std::rc::Rc;

use common::*;

use bluefin_payconex_sdk::core::helpers::{getp, ja, jo, json_thunk, setp, to_int, to_map};
use bluefin_payconex_sdk::utility::voxgigstruct as vs;
use bluefin_payconex_sdk::{Value, BluefinPayconexSDK};

struct AccountUpdaterSubscriptionWithResultDirectSetup {
    client: Rc<BluefinPayconexSDK>,
    calls: Rc<RefCell<Vec<Value>>>,
    live: bool,
    idmap: Value,
}

fn account_updater_subscription_with_result_direct_setup(mockres: Value) -> AccountUpdaterSubscriptionWithResultDirectSetup {
    load_env_local();

    let calls: Rc<RefCell<Vec<Value>>> = Rc::new(RefCell::new(Vec::new()));

    let env = env_override(jo(vec![
        ("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID", Value::empty_map()),
        ("BLUEFINPAYCONEX_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_APIKEY", Value::str("NONE")),
    ]));

    let live = getp(&env, "BLUEFINPAYCONEX_TEST_LIVE") == Value::str("TRUE");

    if live {
        let client = BluefinPayconexSDK::new(jo(vec![("apikey", getp(&env, "BLUEFINPAYCONEX_APIKEY"))]));
        let idmap = match to_map(&getp(&env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };
        return AccountUpdaterSubscriptionWithResultDirectSetup {
            client,
            calls,
            live: true,
            idmap,
        };
    }

    let c = calls.clone();
    let mock_fetch = Value::func(move |_inj, args, _r, _s| {
        let url = vs::get_elem(args, &Value::Num(0.0), Value::Noval);
        let init = vs::get_elem(args, &Value::Num(1.0), Value::Noval);
        c.borrow_mut().push(jo(vec![("url", url), ("init", init)]));
        let data = if mockres.is_noval() || mockres.is_null() {
            jo(vec![("id", Value::str("direct01"))])
        } else {
            mockres.clone()
        };
        jo(vec![
            ("status", Value::Num(200.0)),
            ("statusText", Value::str("OK")),
            ("headers", Value::empty_map()),
            ("json", json_thunk(data)),
        ])
    });

    let client = BluefinPayconexSDK::new(jo(vec![
        ("base", Value::str("http://localhost:8080")),
        ("system", jo(vec![("fetch", mock_fetch)])),
    ]));

    AccountUpdaterSubscriptionWithResultDirectSetup {
        client,
        calls,
        live: false,
        idmap: Value::empty_map(),
    }
}

#[test]
fn account_updater_subscription_with_result_direct_load() {
    let setup = account_updater_subscription_with_result_direct_setup(jo(vec![("id", Value::str("direct01"))]));
    let mode = if setup.live { "live" } else { "unit" };
    let (skip, reason) = is_control_skipped("direct", "direct-load-account_updater_subscription_with_result", mode);
    if skip {
        eprintln!(
            "skip: {}",
            if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            }
        );
        return;
    }
    if setup.live {
        for live_key in ["account01", "subscription01"] {
            if getp(&setup.idmap, live_key).is_noval() {
                eprintln!("skip: live test needs {} via *_ENTID env var (synthetic IDs only)", live_key);
                return;
            }
        }
    }
    let client = setup.client.clone();

    let params = Value::empty_map();
    if setup.live {
        setp(&params, "account_id", getp(&setup.idmap, "account01"));
    } else {
        setp(&params, "account_id", Value::str("direct01"));
    }
    if setup.live {
        setp(&params, "subscription_id", getp(&setup.idmap, "subscription01"));
    } else {
        setp(&params, "subscription_id", Value::str("direct02"));
    }

    let result = client
        .direct(jo(vec![
            ("path", Value::str("api/v4/accounts/{account_id}/account-updater/subscriptions/{subscription_id}")),
            ("method", Value::str("GET")),
            ("params", params.clone()),
        ]))
        .expect("direct failed");

    if setup.live {
        // Live mode is lenient: synthetic IDs frequently 4xx.
        if getp(&result, "ok") != Value::Bool(true) {
            eprintln!("skip: load call not ok (likely synthetic IDs against live API)");
            return;
        }
        let status = to_int(&getp(&result, "status"));
        if !(200..300).contains(&status) {
            eprintln!("skip: expected 2xx status, got {}", status);
            return;
        }
    } else {
        assert_eq!(getp(&result, "ok"), Value::Bool(true), "expected ok true");
        assert_eq!(to_int(&getp(&result, "status")), 200, "expected status 200");
        assert!(
            !getp(&result, "data").is_noval(),
            "expected data to be non-nil"
        );

        let data = getp(&result, "data");
        if let Value::Map(_) = data {
            assert_eq!(
                getp(&data, "id"),
                Value::str("direct01"),
                "expected data.id to be direct01"
            );
        }

        assert_eq!(setup.calls.borrow().len(), 1, "expected 1 call");
        let call = setup.calls.borrow()[0].clone();
        assert_eq!(
            getp(&getp(&call, "init"), "method"),
            Value::str("GET"),
            "expected method GET"
        );
        let url = match getp(&call, "url") {
            Value::Str(u) => u,
            _ => String::new(),
        };
        assert!(
            url.contains("direct01"),
            "expected url to contain direct01, got {}",
            url
        );
        assert!(
            url.contains("direct02"),
            "expected url to contain direct02, got {}",
            url
        );
    }
}
