# IFrameCreateInstance entity test (offline, mock transport)

defmodule BluefinPayconex.IFrameCreateInstanceEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/i_frame_create_instance/IFrameCreateInstanceTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.i_frame_create_instance"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.i_frame_create_instance(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["i_frame_create_instance", S.jm([])])]))
    ent = BluefinPayconex.i_frame_create_instance(sdk)
    made = BluefinPayconex.Entity.IFrameCreateInstance.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
