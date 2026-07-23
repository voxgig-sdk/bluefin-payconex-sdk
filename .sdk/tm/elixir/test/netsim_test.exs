# BluefinPayconex SDK netsim test
#
# Network-behaviour simulation over the offline mock transport (the `test`
# feature's optional `net` block). Driven through direct/2, which needs no
# entity, so it runs for every generated SDK.

defmodule BluefinPayconex.NetsimTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinPayconex.Helpers, as: H

  test "offline simulation fails the request" do
    sdk = BluefinPayconex.test(H.deep(%{"net" => %{"offline" => true}}))
    res = BluefinPayconex.direct(sdk, H.deep(%{"path" => "/ping"}))
    assert S.getprop(res, "ok") == false
  end

  test "fail status simulation surfaces the error status" do
    sdk = BluefinPayconex.test(H.deep(%{"net" => %{"failTimes" => 1, "failStatus" => 503}}))
    res = BluefinPayconex.direct(sdk, H.deep(%{"path" => "/ping"}))
    assert S.getprop(res, "ok") == false
    assert S.getprop(res, "status") == 503
  end

  test "error times simulation yields a connection error" do
    sdk = BluefinPayconex.test(H.deep(%{"net" => %{"errorTimes" => 1}}))
    res = BluefinPayconex.direct(sdk, H.deep(%{"path" => "/ping"}))
    assert S.getprop(res, "ok") == false
    err = S.getprop(res, "err")
    assert err != nil
    assert err.code == "netsim_conn"
  end

  test "latency simulation delays the request" do
    delay = 60
    sdk = BluefinPayconex.test(H.deep(%{"net" => %{"latency" => delay}}))
    start = System.monotonic_time(:millisecond)
    BluefinPayconex.direct(sdk, H.deep(%{"path" => "/ping"}))
    elapsed = System.monotonic_time(:millisecond) - start
    assert elapsed >= delay - 25
  end

  test "injectable sleep keeps latency deterministic" do
    parent = self()

    sdk =
      BluefinPayconex.test(H.deep(%{"net" => %{"latency" => 250, "sleep" => fn ms -> send(parent, {:slept, ms}) end}}))

    BluefinPayconex.direct(sdk, H.deep(%{"path" => "/ping"}))
    assert_receive {:slept, 250}
  end

  test "a plain test sdk still works with no net simulation" do
    sdk = BluefinPayconex.test()
    assert sdk != nil
  end
end
