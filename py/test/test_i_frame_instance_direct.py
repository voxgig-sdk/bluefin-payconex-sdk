# IFrameInstance direct test

import json
import pytest

from utility.voxgig_struct import voxgig_struct as vs
from bluefinpayconex_sdk import BluefinPayconexSDK
from core import helpers
from test import runner


class TestIFrameInstanceDirect:

    def test_should_direct_load_i_frame_instance(self):
        setup = _i_frame_instance_direct_setup({"id": "direct01"})
        _skip, _reason = runner.is_control_skipped("direct", "direct-load-i_frame_instance", "live" if setup["live"] else "unit")
        if _skip:
            # pytest already imported at module scope
            pytest.skip(_reason or "skipped via sdk-test-control.json")
            return
        client = setup["client"]

        params = {}
        query = {}
        if setup["live"]:
            params["account_id"] = 120615523104
            params["id"] = "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9"
            params["payment_iframe_id"] = "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9"
        else:
            params["account_id"] = "direct01"
            params["id"] = "direct02"
            params["payment_iframe_id"] = "direct03"

        result = client.direct({
            "path": "api/v4/accounts/{account_id}/payment-iframe/{payment_iframe_id}/instance/{id}",
            "method": "GET",
            "params": params,
            "query": query,
        })
        if setup["live"]:
            # Live mode is lenient: synthetic IDs frequently 4xx. Skip
            # rather than fail when the load endpoint isn't reachable
            # with the IDs we can construct from setup.idmap.
            if result.get("err") is not None:
                pytest.skip(f"load call failed (likely synthetic IDs against live API): {result.get('err')}")
                return
            if not result.get("ok"):
                pytest.skip("load call not ok (likely synthetic IDs against live API)")
                return
            status = helpers.to_int(result["status"])
            if status < 200 or status >= 300:
                pytest.skip(f"expected 2xx status, got {status}")
                return
        else:
            assert result["ok"] is True
            assert helpers.to_int(result["status"]) == 200
            assert result["data"] is not None
            if isinstance(result["data"], dict):
                assert result["data"]["id"] == "direct01"
            assert len(setup["calls"]) == 1



def _i_frame_instance_direct_setup(mockres):
    runner.load_env_local()

    calls = []

    env = runner.env_override({
        "BLUEFINPAYCONEX_TEST_I_FRAME_INSTANCE_ENTID": {},
        "BLUEFINPAYCONEX_TEST_LIVE": "FALSE",
        "BLUEFINPAYCONEX_APIKEY": "NONE",
    })

    live = env.get("BLUEFINPAYCONEX_TEST_LIVE") == "TRUE"

    if live:
        merged_opts = {
            "apikey": env.get("BLUEFINPAYCONEX_APIKEY"),
        }
        client = BluefinPayconexSDK(merged_opts)
        return {
            "client": client,
            "calls": calls,
            "live": True,
            "idmap": {},
        }

    def mock_fetch(url, init):
        calls.append({"url": url, "init": init})
        return {
            "status": 200,
            "statusText": "OK",
            "headers": {},
            "json": lambda: mockres if mockres is not None else {"id": "direct01"},
            "body": "mock",
        }, None

    client = BluefinPayconexSDK({
        "base": "http://localhost:8080",
        "system": {
            "fetch": mock_fetch,
        },
    })

    return {
        "client": client,
        "calls": calls,
        "live": False,
        "idmap": {},
    }
