# PaymentIframe entity test (offline, mock transport)

defmodule BluefinPayconex.PaymentIframeEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H
  alias BluefinPayconex.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/payment_iframe/PaymentIframeTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinPayconex.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.payment_iframe"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinPayconex.test()
    ent = BluefinPayconex.payment_iframe(sdk)
    assert ent != nil
  end
end
