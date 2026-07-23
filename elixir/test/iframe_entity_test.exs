# Iframe entity test (offline, mock transport)

defmodule BluefinPayconex.IframeEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/iframe/IframeTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.iframe"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.iframe(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinPayconex.iframe(sdk)
    result = BluefinPayconex.Entity.Iframe.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinPayconex.iframe(sdk)
      rec = BluefinPayconex.Entity.Iframe.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["iframe", S.jm([])])]))
    ent = BluefinPayconex.iframe(sdk)
    made = BluefinPayconex.Entity.Iframe.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
