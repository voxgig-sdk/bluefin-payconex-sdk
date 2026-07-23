# AccountUpdaterSchedule entity test (offline, mock transport)

defmodule BluefinPayconex.AccountUpdaterScheduleEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/account_updater_schedule/AccountUpdaterScheduleTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.account_updater_schedule"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.account_updater_schedule(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["account_updater_schedule", S.jm([])])]))
    ent = BluefinPayconex.account_updater_schedule(sdk)
    made = BluefinPayconex.Entity.AccountUpdaterSchedule.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
