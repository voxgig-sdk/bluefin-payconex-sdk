# AccountUpdaterSubscriptionWithResult entity test

import json
import os
import time

import pytest

from utility.voxgig_struct import voxgig_struct as vs
from bluefinpayconex_sdk import BluefinPayconexSDK
from core import helpers

_TEST_DIR = os.path.dirname(os.path.abspath(__file__))
from test import runner


class TestAccountUpdaterSubscriptionWithResultEntity:

    def test_should_create_instance(self):
        testsdk = BluefinPayconexSDK.test(None, None)
        ent = testsdk.AccountUpdaterSubscriptionWithResult(None)
        assert ent is not None

    def test_should_run_basic_flow(self):
        setup = _account_updater_subscription_with_result_basic_setup(None)
        # Per-op sdk-test-control.json skip — basic test exercises a flow with
        # multiple ops; skipping any one skips the whole flow (steps depend
        # on each other).
        _live = setup.get("live", False)
        for _op in ["create", "update", "load"]:
            _skip, _reason = runner.is_control_skipped("entityOp", "account_updater_subscription_with_result." + _op, "live" if _live else "unit")
            if _skip:
                pytest.skip(_reason or "skipped via sdk-test-control.json")
                return
        # The basic flow consumes synthetic IDs from the fixture. In live mode
        # without an *_ENTID env override, those IDs hit the live API and 4xx.
        if setup.get("synthetic_only"):
            pytest.skip("live entity test uses synthetic IDs from fixture — "
                        "set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live")
        client = setup["client"]

        # CREATE
        account_updater_subscription_with_result_ref01_ent = client.AccountUpdaterSubscriptionWithResult(None)
        account_updater_subscription_with_result_ref01_data = helpers.to_map(vs.getprop(
            vs.getpath(setup["data"], "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01"))
        account_updater_subscription_with_result_ref01_data["account_id"] = setup["idmap"]["account01"]
        account_updater_subscription_with_result_ref01_data["subscription_id"] = setup["idmap"]["subscription01"]

        account_updater_subscription_with_result_ref01_data = helpers.to_map(account_updater_subscription_with_result_ref01_ent.create(account_updater_subscription_with_result_ref01_data, None))
        assert account_updater_subscription_with_result_ref01_data is not None
        assert account_updater_subscription_with_result_ref01_data["id"] is not None

        # UPDATE
        account_updater_subscription_with_result_ref01_data_up0_up = {
            "id": account_updater_subscription_with_result_ref01_data["id"],
            "account_id": setup["idmap"]["account_id"],
        }

        account_updater_subscription_with_result_ref01_markdef_up0_name = "created_at"
        account_updater_subscription_with_result_ref01_markdef_up0_value = "Mark01-account_updater_subscription_with_result_ref01_" + str(setup["now"])
        account_updater_subscription_with_result_ref01_data_up0_up[account_updater_subscription_with_result_ref01_markdef_up0_name] = account_updater_subscription_with_result_ref01_markdef_up0_value

        account_updater_subscription_with_result_ref01_resdata_up0 = helpers.to_map(account_updater_subscription_with_result_ref01_ent.update(account_updater_subscription_with_result_ref01_data_up0_up, None))
        assert account_updater_subscription_with_result_ref01_resdata_up0 is not None
        assert account_updater_subscription_with_result_ref01_resdata_up0["id"] == account_updater_subscription_with_result_ref01_data_up0_up["id"]
        assert account_updater_subscription_with_result_ref01_resdata_up0[account_updater_subscription_with_result_ref01_markdef_up0_name] == account_updater_subscription_with_result_ref01_markdef_up0_value

        # LOAD
        account_updater_subscription_with_result_ref01_match_dt0 = {
            "id": account_updater_subscription_with_result_ref01_data["id"],
        }
        account_updater_subscription_with_result_ref01_data_dt0_loaded = account_updater_subscription_with_result_ref01_ent.load(account_updater_subscription_with_result_ref01_match_dt0, None)
        account_updater_subscription_with_result_ref01_data_dt0_load_result = helpers.to_map(account_updater_subscription_with_result_ref01_data_dt0_loaded)
        assert account_updater_subscription_with_result_ref01_data_dt0_load_result is not None
        assert account_updater_subscription_with_result_ref01_data_dt0_load_result["id"] == account_updater_subscription_with_result_ref01_data["id"]



def _account_updater_subscription_with_result_basic_setup(extra):
    runner.load_env_local()

    entity_data_file = os.path.join(_TEST_DIR, "../../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json")
    with open(entity_data_file, "r") as f:
        entity_data_source = f.read()

    entity_data = json.loads(entity_data_source)

    options = {}
    options["entity"] = entity_data.get("existing")

    client = BluefinPayconexSDK.test(options, extra)

    # Generate idmap via transform.
    idmap = vs.transform(
        ["account_updater_subscription_with_result01", "account_updater_subscription_with_result02", "account_updater_subscription_with_result03", "account01", "account02", "account03", "subscription01", "subscription02", "subscription03"],
        {
            "`$PACK`": ["", {
                "`$KEY`": "`$COPY`",
                "`$VAL`": ["`$FORMAT`", "upper", "`$COPY`"],
            }],
        }
    )

    # Detect ENTID env override before envOverride consumes it. When live
    # mode is on without a real override, the basic test runs against synthetic
    # IDs from the fixture and 4xx's. We surface this so the test can skip.
    _entid_env_raw = os.environ.get(
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID")
    _idmap_overridden = _entid_env_raw is not None and _entid_env_raw.strip().startswith("{")

    env = runner.env_override({
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID": idmap,
        "BLUEFINPAYCONEX_TEST_LIVE": "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN": "FALSE",
        "BLUEFINPAYCONEX_APIKEY": "NONE",
    })

    idmap_resolved = helpers.to_map(
        env.get("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"))
    if idmap_resolved is None:
        idmap_resolved = helpers.to_map(idmap)
    if idmap_resolved.get("account_id") is None:
        idmap_resolved["account_id"] = idmap_resolved.get("account01")

    if env.get("BLUEFINPAYCONEX_TEST_LIVE") == "TRUE":
        merged_opts = vs.merge([
            {
                "apikey": env.get("BLUEFINPAYCONEX_APIKEY"),
            },
            extra or {},
        ])
        client = BluefinPayconexSDK(helpers.to_map(merged_opts))

    _live = env.get("BLUEFINPAYCONEX_TEST_LIVE") == "TRUE"
    return {
        "client": client,
        "data": entity_data,
        "idmap": idmap_resolved,
        "env": env,
        "explain": env.get("BLUEFINPAYCONEX_TEST_EXPLAIN") == "TRUE",
        "live": _live,
        "synthetic_only": _live and not _idmap_overridden,
        "now": int(time.time() * 1000),
    }
