# TransactionDetail entity test

import json
import os
import time

import pytest

from utility.voxgig_struct import voxgig_struct as vs
from bluefinpayconex_sdk import BluefinPayconexSDK
from core import helpers

_TEST_DIR = os.path.dirname(os.path.abspath(__file__))
from test import runner


class TestTransactionDetailEntity:

    def test_should_create_instance(self):
        testsdk = BluefinPayconexSDK.test(None, None)
        ent = testsdk.TransactionDetail(None)
        assert ent is not None

    def test_should_run_basic_flow(self):
        setup = _transaction_detail_basic_setup(None)
        # Per-op sdk-test-control.json skip — basic test exercises a flow with
        # multiple ops; skipping any one skips the whole flow (steps depend
        # on each other).
        _live = setup.get("live", False)
        for _op in ["update", "load"]:
            _skip, _reason = runner.is_control_skipped("entityOp", "transaction_detail." + _op, "live" if _live else "unit")
            if _skip:
                pytest.skip(_reason or "skipped via sdk-test-control.json")
                return
        # The basic flow consumes synthetic IDs from the fixture. In live mode
        # without an *_ENTID env override, those IDs hit the live API and 4xx.
        if setup.get("synthetic_only"):
            pytest.skip("live entity test uses synthetic IDs from fixture — "
                        "set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live")
        client = setup["client"]

        # Bootstrap entity data from existing test data.
        transaction_detail_ref01_data_raw = vs.items(helpers.to_map(
            vs.getpath(setup["data"], "existing.transaction_detail")))
        transaction_detail_ref01_data = None
        if len(transaction_detail_ref01_data_raw) > 0:
            transaction_detail_ref01_data = helpers.to_map(transaction_detail_ref01_data_raw[0][1])

        # UPDATE
        transaction_detail_ref01_ent = client.TransactionDetail(None)
        transaction_detail_ref01_data_up0_up = {
            "id": transaction_detail_ref01_data["id"],
            "account_id": setup["idmap"]["account_id"],
        }

        transaction_detail_ref01_markdef_up0_name = "description"
        transaction_detail_ref01_markdef_up0_value = "Mark01-transaction_detail_ref01_" + str(setup["now"])
        transaction_detail_ref01_data_up0_up[transaction_detail_ref01_markdef_up0_name] = transaction_detail_ref01_markdef_up0_value

        transaction_detail_ref01_resdata_up0 = helpers.to_map(transaction_detail_ref01_ent.update(transaction_detail_ref01_data_up0_up, None))
        assert transaction_detail_ref01_resdata_up0 is not None
        assert transaction_detail_ref01_resdata_up0["id"] == transaction_detail_ref01_data_up0_up["id"]
        assert transaction_detail_ref01_resdata_up0[transaction_detail_ref01_markdef_up0_name] == transaction_detail_ref01_markdef_up0_value

        # LOAD
        transaction_detail_ref01_match_dt0 = {
            "id": transaction_detail_ref01_data["id"],
        }
        transaction_detail_ref01_data_dt0_loaded = transaction_detail_ref01_ent.load(transaction_detail_ref01_match_dt0, None)
        transaction_detail_ref01_data_dt0_load_result = helpers.to_map(transaction_detail_ref01_data_dt0_loaded)
        assert transaction_detail_ref01_data_dt0_load_result is not None
        assert transaction_detail_ref01_data_dt0_load_result["id"] == transaction_detail_ref01_data["id"]



def _transaction_detail_basic_setup(extra):
    runner.load_env_local()

    entity_data_file = os.path.join(_TEST_DIR, "../../.sdk/test/entity/transaction_detail/TransactionDetailTestData.json")
    with open(entity_data_file, "r") as f:
        entity_data_source = f.read()

    entity_data = json.loads(entity_data_source)

    options = {}
    options["entity"] = entity_data.get("existing")

    client = BluefinPayconexSDK.test(options, extra)

    # Generate idmap via transform.
    idmap = vs.transform(
        ["transaction_detail01", "transaction_detail02", "transaction_detail03", "account01", "account02", "account03", "payment01", "payment02", "payment03"],
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
        "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID")
    _idmap_overridden = _entid_env_raw is not None and _entid_env_raw.strip().startswith("{")

    env = runner.env_override({
        "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID": idmap,
        "BLUEFINPAYCONEX_TEST_LIVE": "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN": "FALSE",
        "BLUEFINPAYCONEX_APIKEY": "NONE",
    })

    idmap_resolved = helpers.to_map(
        env.get("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"))
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
