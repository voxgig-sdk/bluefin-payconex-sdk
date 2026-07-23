defmodule BluefinPayconex.ExistsTest do
  use ExUnit.Case

  test "should create test sdk" do
    testsdk = BluefinPayconex.test()
    assert testsdk != nil
  end
end
