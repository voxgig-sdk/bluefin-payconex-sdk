# ThreeDSecureStatus direct test

require "minitest/autorun"
require "json"
require_relative "../BluefinPayconex_sdk"
require_relative "runner"

class ThreeDSecureStatusDirectTest < Minitest::Test
  def test_direct_load_three_d_secure_status
    setup = three_d_secure_status_direct_setup({ "id" => "direct01" })
    _should_skip, _reason = Runner.is_control_skipped("direct", "direct-load-three_d_secure_status", setup[:live] ? "live" : "unit")
    if _should_skip
      skip(_reason || "skipped via sdk-test-control.json")
      return
    end
    client = setup[:client]

    params = {}
    query = {}
    if setup[:live]
      params["3_d_id"] = "tds_23d0e53de3c64e94887116da65abc8ce"
      params["account_id"] = "120615523104"
    else
      params["3_d_id"] = "direct01"
      params["account_id"] = "direct02"
    end

    result = client.direct({
      "path" => "api/v4/accounts/{account_id}/3DS/{3_d_id}/status",
      "method" => "GET",
      "params" => params,
      "query" => query,
    })
    if setup[:live]
      # Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
      # than fail when the load endpoint isn't reachable with the IDs
      # we can construct from setup.idmap.
      if !result["err"].nil?
        skip("load call failed (likely synthetic IDs against live API): #{result["err"]}")
        return
      end
      unless result["ok"]
        skip("load call not ok (likely synthetic IDs against live API)")
        return
      end
      status = Helpers.to_int(result["status"])
      if status < 200 || status >= 300
        skip("expected 2xx status, got #{status}")
        return
      end
    else
      assert_nil result["err"]
      assert result["ok"]
      assert_equal 200, Helpers.to_int(result["status"])
      assert !result["data"].nil?
      if result["data"].is_a?(Hash)
        assert_equal "direct01", result["data"]["id"]
      end
      assert_equal 1, setup[:calls].length
    end
  end

end


def three_d_secure_status_direct_setup(mockres)
  Runner.load_env_local

  calls = []

  env = Runner.env_override({
    "BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID" => {},
    "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
    "BLUEFINPAYCONEX_APIKEY" => "NONE",
  })

  live = env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE"

  if live
    merged_opts = {
      "apikey" => env["BLUEFINPAYCONEX_APIKEY"],
    }
    client = BluefinPayconexSDK.new(merged_opts)
    return {
      client: client,
      calls: calls,
      live: true,
      idmap: {},
    }
  end

  mock_fetch = ->(url, init) {
    calls.push({ "url" => url, "init" => init })
    return {
      "status" => 200,
      "statusText" => "OK",
      "headers" => {},
      "json" => ->() {
        if !mockres.nil?
          return mockres
        end
        return { "id" => "direct01" }
      },
      "body" => "mock",
    }, nil
  }

  client = BluefinPayconexSDK.new({
    "base" => "http://localhost:8080",
    "system" => {
      "fetch" => mock_fetch,
    },
  })

  {
    client: client,
    calls: calls,
    live: false,
    idmap: {},
  }
end
