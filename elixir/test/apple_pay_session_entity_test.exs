# ApplePaySession entity test (offline, mock transport)

defmodule BluefinPayconex.ApplePaySessionEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/apple_pay_session/ApplePaySessionTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.apple_pay_session"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.apple_pay_session(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["apple_pay_session", S.jm([])])]))
    ent = BluefinPayconex.apple_pay_session(sdk)
    made = BluefinPayconex.Entity.ApplePaySession.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
