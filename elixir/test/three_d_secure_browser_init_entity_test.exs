# ThreeDSecureBrowserInit entity test (offline, mock transport)

defmodule BluefinPayconex.ThreeDSecureBrowserInitEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/three_d_secure_browser_init/ThreeDSecureBrowserInitTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.three_d_secure_browser_init"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.three_d_secure_browser_init(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["three_d_secure_browser_init", S.jm([])])]))
    ent = BluefinPayconex.three_d_secure_browser_init(sdk)
    made = BluefinPayconex.Entity.ThreeDSecureBrowserInit.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
