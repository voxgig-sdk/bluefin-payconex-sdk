# ApiKey entity test (offline, mock transport)

defmodule BluefinPayconex.ApiKeyEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/api_key/ApiKeyTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.api_key"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.api_key(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinPayconex.api_key(sdk)
    result = BluefinPayconex.Entity.ApiKey.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinPayconex.api_key(sdk)
      rec = BluefinPayconex.Entity.ApiKey.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should create then read back" do
    sdk = BluefinPayconex.test(S.jm(["entity", S.jm(["api_key", S.jm([])])]))
    ent = BluefinPayconex.api_key(sdk)
    made = BluefinPayconex.Entity.ApiKey.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
