// Generated basic-flow test for the transaction_detail entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_payconex_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_payconex_sdk::utility::voxgigstruct as vs;
use bluefin_payconex_sdk::{test_sdk, Entity, BluefinPayconexEntity, BluefinPayconexSDK, Value};

#[test]
fn transaction_detail_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.transaction_detail(Value::Noval);
    assert_eq!(ent.get_name(), "transaction_detail");
}

#[test]
fn transaction_detail_entity_basic() {
    let setup = transaction_detail_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["update", "load"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("transaction_detail.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();

    // Bootstrap entity data from existing test data (no create step in flow).
    let transaction_detail_ref01_data_raw = vs::items(&to_map(&getpath(&["existing", "transaction_detail"], &setup.data)));
    let transaction_detail_ref01_data = to_map(&vs::get_elem(
        &vs::get_elem(&transaction_detail_ref01_data_raw, &Value::Num(0.0), Value::Noval),
        &Value::Num(1.0),
        Value::Noval,
    ));
    // UPDATE
    let transaction_detail_ref01_ent = client.transaction_detail(Value::Noval);
    let transaction_detail_ref01_data_up0_up = Value::empty_map();
    setp(&transaction_detail_ref01_data_up0_up, "id", getp(&transaction_detail_ref01_data, "id"));
    setp(&transaction_detail_ref01_data_up0_up, "account_id", getp(&setup.idmap, "account_id"));

    let transaction_detail_ref01_markdef_up0_name = "description";
    let transaction_detail_ref01_markdef_up0_value = format!("Mark01-transaction_detail_ref01_{}", setup.now);
    setp(
        &transaction_detail_ref01_data_up0_up,
        transaction_detail_ref01_markdef_up0_name,
        Value::str(transaction_detail_ref01_markdef_up0_value.clone()),
    );

    let transaction_detail_ref01_resdata_up0_result = transaction_detail_ref01_ent
        .update(transaction_detail_ref01_data_up0_up.clone(), Value::Noval)
        .expect("update failed");
    let transaction_detail_ref01_resdata_up0 = to_map(&transaction_detail_ref01_resdata_up0_result);
    assert!(
        matches!(transaction_detail_ref01_resdata_up0, Value::Map(_)),
        "expected update result to be a map"
    );
    assert_eq!(
        getp(&transaction_detail_ref01_resdata_up0, "id"),
        getp(&transaction_detail_ref01_data_up0_up, "id"),
        "expected update result id to match"
    );
    assert_eq!(
        getp(&transaction_detail_ref01_resdata_up0, transaction_detail_ref01_markdef_up0_name),
        Value::str(transaction_detail_ref01_markdef_up0_value.clone()),
        "expected {} to be updated",
        transaction_detail_ref01_markdef_up0_name
    );

    // LOAD
    let transaction_detail_ref01_match_dt0 = jo(vec![("id", getp(&transaction_detail_ref01_data, "id"))]);
    let transaction_detail_ref01_data_dt0_loaded = transaction_detail_ref01_ent
        .load(transaction_detail_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let transaction_detail_ref01_data_dt0_load_result = to_map(&transaction_detail_ref01_data_dt0_loaded);
    assert!(
        matches!(transaction_detail_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&transaction_detail_ref01_data_dt0_load_result, "id"),
        getp(&transaction_detail_ref01_data, "id"),
        "expected load result id to match"
    );

}

fn transaction_detail_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("transaction_detail");
    entity_data_file.push("TransactionDetailTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("transaction_detail01"), Value::str("transaction_detail02"), Value::str("transaction_detail03"), Value::str("account01"), Value::str("account02"), Value::str("account03"), Value::str("payment01"), Value::str("payment02"), Value::str("payment03")]),
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
    let entid_env_raw = std::env::var("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID", idmap.clone()),
        ("BLUEFINPAYCONEX_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID")) {
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
