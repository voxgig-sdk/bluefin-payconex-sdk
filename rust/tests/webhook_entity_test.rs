// Generated basic-flow test for the webhook entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_payconex_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_payconex_sdk::utility::voxgigstruct as vs;
use bluefin_payconex_sdk::{test_sdk, Entity, BluefinPayconexEntity, BluefinPayconexSDK, Value};

#[test]
fn webhook_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.webhook(Value::Noval);
    assert_eq!(ent.get_name(), "webhook");
}

#[test]
fn webhook_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "webhook",
            jo(vec![
                ("strm01", jo(vec![("id", Value::str("strm01"))])),
                ("strm02", jo(vec![("id", Value::str("strm02"))])),
            ]),
        )]),
    )]);

    let sdkopts = jo(vec![(
        "feature",
        jo(vec![("streaming", jo(vec![("active", Value::Bool(true))]))]),
    )]);

    let testsdk = test_sdk(seed.clone(), sdkopts);
    let ent = testsdk.webhook(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.webhook(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn webhook_entity_basic() {
    let setup = webhook_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "list", "update", "load", "remove"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("webhook.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let webhook_ref01_ent = client.webhook(Value::Noval);
    let webhook_ref01_data = to_map(&getp(
        &getpath(&["new", "webhook"], &setup.data),
        "webhook_ref01",
    ));
    setp(&webhook_ref01_data, "account_id", getp(&setup.idmap, "account01"));

    let webhook_ref01_data_result = webhook_ref01_ent
        .create(webhook_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let webhook_ref01_data = to_map(&webhook_ref01_data_result);
    assert!(
        matches!(webhook_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&webhook_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // LIST
    let webhook_ref01_match = Value::empty_map();
    setp(&webhook_ref01_match, "account_id", getp(&setup.idmap, "account01"));

    let webhook_ref01_list = webhook_ref01_ent
        .list(webhook_ref01_match.clone(), Value::Noval)
        .expect("list failed");
    assert!(
        matches!(webhook_ref01_list, Value::List(_)),
        "expected list result to be an array"
    );

    let found_item = vs::select(
        &entity_list_to_data(&webhook_ref01_list),
        &jo(vec![("id", getp(&webhook_ref01_data, "id"))]),
    );
    assert!(
        !vs::is_empty(&found_item),
        "expected to find created entity in list"
    );

    // UPDATE
    let webhook_ref01_data_up0_up = Value::empty_map();
    setp(&webhook_ref01_data_up0_up, "id", getp(&webhook_ref01_data, "id"));
    setp(&webhook_ref01_data_up0_up, "account_id", getp(&setup.idmap, "account_id"));

    let webhook_ref01_markdef_up0_name = "event";
    let webhook_ref01_markdef_up0_value = format!("Mark01-webhook_ref01_{}", setup.now);
    setp(
        &webhook_ref01_data_up0_up,
        webhook_ref01_markdef_up0_name,
        Value::str(webhook_ref01_markdef_up0_value.clone()),
    );

    let webhook_ref01_resdata_up0_result = webhook_ref01_ent
        .update(webhook_ref01_data_up0_up.clone(), Value::Noval)
        .expect("update failed");
    let webhook_ref01_resdata_up0 = to_map(&webhook_ref01_resdata_up0_result);
    assert!(
        matches!(webhook_ref01_resdata_up0, Value::Map(_)),
        "expected update result to be a map"
    );
    assert_eq!(
        getp(&webhook_ref01_resdata_up0, "id"),
        getp(&webhook_ref01_data_up0_up, "id"),
        "expected update result id to match"
    );
    assert_eq!(
        getp(&webhook_ref01_resdata_up0, webhook_ref01_markdef_up0_name),
        Value::str(webhook_ref01_markdef_up0_value.clone()),
        "expected {} to be updated",
        webhook_ref01_markdef_up0_name
    );

    // LOAD
    let webhook_ref01_match_dt0 = jo(vec![("id", getp(&webhook_ref01_data, "id"))]);
    let webhook_ref01_data_dt0_loaded = webhook_ref01_ent
        .load(webhook_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let webhook_ref01_data_dt0_load_result = to_map(&webhook_ref01_data_dt0_loaded);
    assert!(
        matches!(webhook_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&webhook_ref01_data_dt0_load_result, "id"),
        getp(&webhook_ref01_data, "id"),
        "expected load result id to match"
    );

    // REMOVE
    let webhook_ref01_match_rm0 = jo(vec![("id", getp(&webhook_ref01_data, "id"))]);
    webhook_ref01_ent
        .remove(webhook_ref01_match_rm0.clone(), Value::Noval)
        .expect("remove failed");

    // LIST
    let webhook_ref01_match_rt0 = Value::empty_map();
    setp(&webhook_ref01_match_rt0, "account_id", getp(&setup.idmap, "account01"));

    let webhook_ref01_list_rt0 = webhook_ref01_ent
        .list(webhook_ref01_match_rt0.clone(), Value::Noval)
        .expect("list failed");
    assert!(
        matches!(webhook_ref01_list_rt0, Value::List(_)),
        "expected list result to be an array"
    );

    let not_found_item = vs::select(
        &entity_list_to_data(&webhook_ref01_list_rt0),
        &jo(vec![("id", getp(&webhook_ref01_data, "id"))]),
    );
    assert!(
        vs::is_empty(&not_found_item),
        "expected removed entity to not be in list"
    );

}

fn webhook_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("webhook");
    entity_data_file.push("WebhookTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("webhook01"), Value::str("webhook02"), Value::str("webhook03"), Value::str("account01"), Value::str("account02"), Value::str("account03")]),
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
    let entid_env_raw = std::env::var("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID", idmap.clone()),
        ("BLUEFINPAYCONEX_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINPAYCONEX_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID")) {
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
