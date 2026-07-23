// Generated basic-flow test for the account_updater_subscription_with_result entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_payconex_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_payconex_sdk::utility::voxgigstruct as vs;
use bluefin_payconex_sdk::{test_sdk, Entity, BluefinPayconexEntity, BluefinPayconexSDK, Value};

#[test]
fn account_updater_subscription_with_result_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.account_updater_subscription_with_result(Value::Noval);
    assert_eq!(ent.get_name(), "account_updater_subscription_with_result");
}

#[test]
fn account_updater_subscription_with_result_entity_basic() {
    let setup = account_updater_subscription_with_result_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "update", "load"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("account_updater_subscription_with_result.{}", op), mode);
        if skip {
            let reason = if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            };
            eprintln!("skip: {}", reason);
            return;
        }
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only {
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let account_updater_subscription_with_result_ref01_ent = client.account_updater_subscription_with_result(Value::Noval);
    let account_updater_subscription_with_result_ref01_data = to_map(&getp(
        &getpath(&["new", "account_updater_subscription_with_result"], &setup.data),
        "account_updater_subscription_with_result_ref01",
    ));
    setp(&account_updater_subscription_with_result_ref01_data, "account_id", getp(&setup.idmap, "account01"));
    setp(&account_updater_subscription_with_result_ref01_data, "subscription_id", getp(&setup.idmap, "subscription01"));

    let account_updater_subscription_with_result_ref01_data_result = account_updater_subscription_with_result_ref01_ent
        .create(account_updater_subscription_with_result_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let account_updater_subscription_with_result_ref01_data = to_map(&account_updater_subscription_with_result_ref01_data_result);
    assert!(
        matches!(account_updater_subscription_with_result_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&account_updater_subscription_with_result_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // UPDATE
    let account_updater_subscription_with_result_ref01_data_up0_up = Value::empty_map();
    setp(&account_updater_subscription_with_result_ref01_data_up0_up, "id", getp(&account_updater_subscription_with_result_ref01_data, "id"));
    setp(&account_updater_subscription_with_result_ref01_data_up0_up, "account_id", getp(&setup.idmap, "account_id"));

    let account_updater_subscription_with_result_ref01_markdef_up0_name = "created_at";
    let account_updater_subscription_with_result_ref01_markdef_up0_value = format!("Mark01-account_updater_subscription_with_result_ref01_{}", setup.now);
    setp(
        &account_updater_subscription_with_result_ref01_data_up0_up,
        account_updater_subscription_with_result_ref01_markdef_up0_name,
        Value::str(account_updater_subscription_with_result_ref01_markdef_up0_value.clone()),
    );

    let account_updater_subscription_with_result_ref01_resdata_up0_result = account_updater_subscription_with_result_ref01_ent
        .update(account_updater_subscription_with_result_ref01_data_up0_up.clone(), Value::Noval)
        .expect("update failed");
    let account_updater_subscription_with_result_ref01_resdata_up0 = to_map(&account_updater_subscription_with_result_ref01_resdata_up0_result);
    assert!(
        matches!(account_updater_subscription_with_result_ref01_resdata_up0, Value::Map(_)),
        "expected update result to be a map"
    );
    assert_eq!(
        getp(&account_updater_subscription_with_result_ref01_resdata_up0, "id"),
        getp(&account_updater_subscription_with_result_ref01_data_up0_up, "id"),
        "expected update result id to match"
    );
    assert_eq!(
        getp(&account_updater_subscription_with_result_ref01_resdata_up0, account_updater_subscription_with_result_ref01_markdef_up0_name),
        Value::str(account_updater_subscription_with_result_ref01_markdef_up0_value.clone()),
        "expected {} to be updated",
        account_updater_subscription_with_result_ref01_markdef_up0_name
    );

    // LOAD
    let account_updater_subscription_with_result_ref01_match_dt0 = jo(vec![("id", getp(&account_updater_subscription_with_result_ref01_data, "id"))]);
    let account_updater_subscription_with_result_ref01_data_dt0_loaded = account_updater_subscription_with_result_ref01_ent
        .load(account_updater_subscription_with_result_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let account_updater_subscription_with_result_ref01_data_dt0_load_result = to_map(&account_updater_subscription_with_result_ref01_data_dt0_loaded);
    assert!(
        matches!(account_updater_subscription_with_result_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&account_updater_subscription_with_result_ref01_data_dt0_load_result, "id"),
        getp(&account_updater_subscription_with_result_ref01_data, "id"),
        "expected load result id to match"
    );

}

fn account_updater_subscription_with_result_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("account_updater_subscription_with_result");
    entity_data_file.push("AccountUpdaterSubscriptionWithResultTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("account_updater_subscription_with_result01"), Value::str("account_updater_subscription_with_result02"), Value::str("account_updater_subscription_with_result03"), Value::str("account01"), Value::str("account02"), Value::str("account03"), Value::str("subscription01"), Value::str("subscription02"), Value::str("subscription03")]),
        &jo(vec![(
            "`$PACK`",
            ja(vec![
                Value::str(""),
                jo(vec![
                    ("`$KEY`", Value::str("`$COPY`")),
                    (
                        "`$VAL`",
                        ja(vec![
                            Value::str("`$FORMAT`"),
                            Value::str("upper"),
                            Value::str("`$COPY`"),
                        ]),
                    ),
                ]),
            ]),
        )]),
        None,
    )
    .unwrap_or_else(|_| Value::empty_map());

    // Detect ENTID env override before env_override consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's.
    let entid_env_raw = std::env::var("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID", idmap.clone()),
        ("BLUEFINPAYCONEX_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    // Add account_id alias for the update test.
    if getp(&idmap_resolved, "account_id").is_noval() {
        let aliased = getp(&idmap_resolved, "account01");
        setp(&idmap_resolved, "account_id", aliased);
    }

    let live = getp(&env, "BLUEFINPAYCONEX_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            &ja(vec![jo(vec![("apikey", getp(&env, "BLUEFINPAYCONEX_APIKEY"))]), extra]),
            None,
        );
        BluefinPayconexSDK::new(to_map(&merged))
    } else {
        client
    };

    EntityTestSetup {
        client,
        data: entity_data,
        idmap: idmap_resolved,
        env: env.clone(),
        explain: getp(&env, "BLUEFINPAYCONEX_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}
