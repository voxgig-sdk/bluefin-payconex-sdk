// Generated basic-flow test for the account_updater_update entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_payconex_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_payconex_sdk::utility::voxgigstruct as vs;
use bluefin_payconex_sdk::{test_sdk, Entity, BluefinPayconexEntity, BluefinPayconexSDK, Value};

#[test]
fn account_updater_update_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.account_updater_update(Value::Noval);
    assert_eq!(ent.get_name(), "account_updater_update");
}

#[test]
fn account_updater_update_entity_basic() {
    let setup = account_updater_update_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["load"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("account_updater_update.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();

    // Bootstrap entity data from existing test data (no create step in flow).
    let account_updater_update_ref01_data_raw = vs::items(&to_map(&getpath(&["existing", "account_updater_update"], &setup.data)));
    let account_updater_update_ref01_data = to_map(&vs::get_elem(
        &vs::get_elem(&account_updater_update_ref01_data_raw, &Value::Num(0.0), Value::Noval),
        &Value::Num(1.0),
        Value::Noval,
    ));
    // LOAD
    let account_updater_update_ref01_ent = client.account_updater_update(Value::Noval);
    let account_updater_update_ref01_match_dt0 = jo(vec![("id", getp(&account_updater_update_ref01_data, "id"))]);
    let account_updater_update_ref01_data_dt0_loaded = account_updater_update_ref01_ent
        .load(account_updater_update_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let account_updater_update_ref01_data_dt0_load_result = to_map(&account_updater_update_ref01_data_dt0_loaded);
    assert!(
        matches!(account_updater_update_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&account_updater_update_ref01_data_dt0_load_result, "id"),
        getp(&account_updater_update_ref01_data, "id"),
        "expected load result id to match"
    );

}

fn account_updater_update_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("account_updater_update");
    entity_data_file.push("AccountUpdaterUpdateTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("account_updater_update01"), Value::str("account_updater_update02"), Value::str("account_updater_update03"), Value::str("account01"), Value::str("account02"), Value::str("account03")]),
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
    let entid_env_raw = std::env::var("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID", idmap.clone()),
        ("BLUEFINPAYCONEX_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

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
