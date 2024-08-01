require "test_helper"

class ClientTest < Minitest::Test
  def test_api_key
    Hipcall.api_key = "test"
    assert_equal "test", Hipcall.api_key
  end
end
