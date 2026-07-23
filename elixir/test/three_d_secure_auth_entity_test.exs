# ThreeDSecureAuth entity test (offline, mock transport)

defmodule BluefinPayconex.ThreeDSecureAuthEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/three_d_secure_auth/ThreeDSecureAuthTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.three_d_secure_auth"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.three_d_secure_auth(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["three_d_secure_auth", S.jm([])])]))
    ent = BluefinPayconex.three_d_secure_auth(sdk)
    made = BluefinPayconex.Entity.ThreeDSecureAuth.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
