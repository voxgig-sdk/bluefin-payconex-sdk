# ListApiKeyScopesEntry entity test (offline, mock transport)

defmodule BluefinPayconex.ListApiKeyScopesEntryEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/list_api_key_scopes_entry/ListApiKeyScopesEntryTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.list_api_key_scopes_entry"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.list_api_key_scopes_entry(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinPayconex.list_api_key_scopes_entry(sdk)
    result = BluefinPayconex.Entity.ListApiKeyScopesEntry.list(ent, S.jm([]))
    assert S.islist(result)
  end
end
