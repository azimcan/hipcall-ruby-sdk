require "test_helper"

class NumbersResourceTest < Minitest::Test
  def test_list
    stub = stub_request("numbers", response: stub_response(fixture: "numbers/list"))
    client = Hipcall::Client.new(api_key: "fake", version: "v3", adapter: :test, stubs: stub)
    numbers = client.numbers.list

    assert_instance_of Hipcall::Collection, numbers
    assert_instance_of Hipcall::Number, numbers.data.first
  end

  def test_retrieve
    number_id = 1
    stub = stub_request("numbers/#{number_id}", response: stub_response(fixture: "numbers/retrieve"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    number = client.numbers.retrieve(number_id:)

    assert_instance_of Hipcall::Number, number
    assert_equal 1, number.id
  end
end
