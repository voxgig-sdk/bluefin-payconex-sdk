# BluefinPayconex SDK exists test

require "minitest/autorun"
require_relative "../BluefinPayconex_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BluefinPayconexSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
