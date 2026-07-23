# IFrameCreateInstance entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinPayconex_sdk"
require_relative "runner"

class IFrameCreateInstanceEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinPayconexSDK.test(nil, nil)
    ent = testsdk.IFrameCreateInstance(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = i_frame_create_instance_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "i_frame_create_instance." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    i_frame_create_instance_ref01_ent = client.IFrameCreateInstance(nil)
    i_frame_create_instance_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.i_frame_create_instance"), "i_frame_create_instance_ref01"))
    i_frame_create_instance_ref01_data["account_id"] = setup[:idmap]["account01"]
    i_frame_create_instance_ref01_data["payment_iframe_id"] = setup[:idmap]["payment_iframe01"]

    i_frame_create_instance_ref01_data_result = i_frame_create_instance_ref01_ent.create(i_frame_create_instance_ref01_data, nil)
    i_frame_create_instance_ref01_data = Helpers.to_map(i_frame_create_instance_ref01_data_result)
    assert !i_frame_create_instance_ref01_data.nil?

  end
end

def i_frame_create_instance_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "i_frame_create_instance", "IFrameCreateInstanceTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinPayconexSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["i_frame_create_instance01", "i_frame_create_instance02", "i_frame_create_instance03", "account01", "account02", "account03", "payment_iframe01", "payment_iframe02", "payment_iframe03"],
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
  entid_env_raw = ENV["BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID" => idmap,
    "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
    "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
    "BLUEFINPAYCONEX_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID"])
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
