-- AccountUpdaterSchedule entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("bluefin-payconex_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("AccountUpdaterScheduleEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:AccountUpdaterSchedule(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = account_updater_schedule_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"create"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "account_updater_schedule." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- CREATE
    local account_updater_schedule_ref01_ent = client:AccountUpdaterSchedule(nil)
    local account_updater_schedule_ref01_data = helpers.to_map(vs.getprop(
      vs.getpath(setup.data, "new.account_updater_schedule"), "account_updater_schedule_ref01"))
    account_updater_schedule_ref01_data["account_id"] = setup.idmap["account01"]

    local account_updater_schedule_ref01_data_result, err = account_updater_schedule_ref01_ent:create(account_updater_schedule_ref01_data, nil)
    assert.is_nil(err)
    account_updater_schedule_ref01_data = helpers.to_map(account_updater_schedule_ref01_data_result)
    assert.is_not_nil(account_updater_schedule_ref01_data)

  end)
end)

function account_updater_schedule_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/account_updater_schedule/AccountUpdaterScheduleTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read account_updater_schedule test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "account_updater_schedule01", "account_updater_schedule02", "account_updater_schedule03", "account01", "account02", "account03" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID"] = idmap,
    ["BLUEFINPAYCONEX_TEST_LIVE"] = "FALSE",
    ["BLUEFINPAYCONEX_TEST_EXPLAIN"] = "FALSE",
    ["BLUEFINPAYCONEX_APIKEY"] = "NONE",
  })

  local idmap_resolved = helpers.to_map(
    env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
        apikey = env["BLUEFINPAYCONEX_APIKEY"],
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["BLUEFINPAYCONEX_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
