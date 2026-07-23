# AccountUpdaterSubscriptionWithResult entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinPayconex_sdk"
require_relative "runner"

class AccountUpdaterSubscriptionWithResultEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinPayconexSDK.test(nil, nil)
    ent = testsdk.AccountUpdaterSubscriptionWithResult(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = account_updater_subscription_with_result_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create", "update", "load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "account_updater_subscription_with_result." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    account_updater_subscription_with_result_ref01_ent = client.AccountUpdaterSubscriptionWithResult(nil)
    account_updater_subscription_with_result_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01"))
    account_updater_subscription_with_result_ref01_data["account_id"] = setup[:idmap]["account01"]
    account_updater_subscription_with_result_ref01_data["subscription_id"] = setup[:idmap]["subscription01"]

    account_updater_subscription_with_result_ref01_data_result = account_updater_subscription_with_result_ref01_ent.create(account_updater_subscription_with_result_ref01_data, nil)
    account_updater_subscription_with_result_ref01_data = Helpers.to_map(account_updater_subscription_with_result_ref01_data_result)
    assert !account_updater_subscription_with_result_ref01_data.nil?
    assert !account_updater_subscription_with_result_ref01_data["id"].nil?

    # UPDATE
    account_updater_subscription_with_result_ref01_data_up0_up = {
      "id" => account_updater_subscription_with_result_ref01_data["id"],
      "account_id" => setup[:idmap]["account_id"],
    }

    account_updater_subscription_with_result_ref01_markdef_up0_name = "created_at"
    account_updater_subscription_with_result_ref01_markdef_up0_value = "Mark01-account_updater_subscription_with_result_ref01_#{setup[:now]}"
    account_updater_subscription_with_result_ref01_data_up0_up[account_updater_subscription_with_result_ref01_markdef_up0_name] = account_updater_subscription_with_result_ref01_markdef_up0_value

    account_updater_subscription_with_result_ref01_resdata_up0_result = account_updater_subscription_with_result_ref01_ent.update(account_updater_subscription_with_result_ref01_data_up0_up, nil)
    account_updater_subscription_with_result_ref01_resdata_up0 = Helpers.to_map(account_updater_subscription_with_result_ref01_resdata_up0_result)
    assert !account_updater_subscription_with_result_ref01_resdata_up0.nil?
    assert_equal account_updater_subscription_with_result_ref01_resdata_up0["id"], account_updater_subscription_with_result_ref01_data_up0_up["id"]
    assert_equal account_updater_subscription_with_result_ref01_resdata_up0[account_updater_subscription_with_result_ref01_markdef_up0_name], account_updater_subscription_with_result_ref01_markdef_up0_value

    # LOAD
    account_updater_subscription_with_result_ref01_match_dt0 = {
      "id" => account_updater_subscription_with_result_ref01_data["id"],
    }
    account_updater_subscription_with_result_ref01_data_dt0_loaded = account_updater_subscription_with_result_ref01_ent.load(account_updater_subscription_with_result_ref01_match_dt0, nil)
    account_updater_subscription_with_result_ref01_data_dt0_load_result = Helpers.to_map(account_updater_subscription_with_result_ref01_data_dt0_loaded)
    assert !account_updater_subscription_with_result_ref01_data_dt0_load_result.nil?
    assert_equal account_updater_subscription_with_result_ref01_data_dt0_load_result["id"], account_updater_subscription_with_result_ref01_data["id"]

  end
end

def account_updater_subscription_with_result_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "account_updater_subscription_with_result", "AccountUpdaterSubscriptionWithResultTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinPayconexSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["account_updater_subscription_with_result01", "account_updater_subscription_with_result02", "account_updater_subscription_with_result03", "account01", "account02", "account03", "subscription01", "subscription02", "subscription03"],
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
  entid_env_raw = ENV["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID" => idmap,
    "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
    "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
    "BLUEFINPAYCONEX_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end
  if idmap_resolved["account_id"].nil?
    idmap_resolved["account_id"] = idmap_resolved["account01"]
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
