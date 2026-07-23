# ThreeDSecureAuth entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinPayconex_sdk"
require_relative "runner"

class ThreeDSecureAuthEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinPayconexSDK.test(nil, nil)
    ent = testsdk.ThreeDSecureAuth(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = three_d_secure_auth_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "three_d_secure_auth." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    three_d_secure_auth_ref01_ent = client.ThreeDSecureAuth(nil)
    three_d_secure_auth_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.three_d_secure_auth"), "three_d_secure_auth_ref01"))
    three_d_secure_auth_ref01_data["3_d_id"] = setup[:idmap]["3_d01"]
    three_d_secure_auth_ref01_data["account_id"] = setup[:idmap]["account01"]

    three_d_secure_auth_ref01_data_result = three_d_secure_auth_ref01_ent.create(three_d_secure_auth_ref01_data, nil)
    three_d_secure_auth_ref01_data = Helpers.to_map(three_d_secure_auth_ref01_data_result)
    assert !three_d_secure_auth_ref01_data.nil?

  end
end

def three_d_secure_auth_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "three_d_secure_auth", "ThreeDSecureAuthTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinPayconexSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["three_d_secure_auth01", "three_d_secure_auth02", "three_d_secure_auth03", "account01", "account02", "account03", "3_d01", "3_d02", "3_d03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID" => idmap,
    "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
    "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
    "BLUEFINPAYCONEX_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["BLUEFINPAYCONEX_APIKEY"],
      },
      extra || {},
    ])
    client = BluefinPayconexSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFINPAYCONEX_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
