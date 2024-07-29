require "test_helper"

class GreetingsResourceTest < Minitest::Test
  def test_list
    stub = stub_request("greetings", response: stub_response(fixture: "greetings/list"))
    client = Hipcall::Client.new(api_key: "fake", version: "v3", adapter: :test, stubs: stub)
    greetings = client.greetings.list

    assert_instance_of Hipcall::Collection, greetings
    assert_instance_of Hipcall::Greeting, greetings.data.first
  end

  def test_retrieve
    greeting_id = 1
    stub = stub_request("greetings/#{greeting_id}", response: stub_response(fixture: "greetings/retrieve"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    greeting = client.greetings.retrieve(greeting_id:)

    assert_instance_of Hipcall::Greeting, greeting
    assert_equal 1, greeting.id
  end
end
