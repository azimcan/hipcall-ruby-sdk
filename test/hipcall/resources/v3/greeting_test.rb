require "test_helper"

class GreetingTest < Minitest::Test
  def test_list
    stub_request(:get, "greetings", response: stub_response(fixture: "greetings/list"))
    greetings = Hipcall::Greeting.list

    assert_instance_of Hipcall::Collection, greetings
    assert_instance_of Hipcall::Objects::Greeting, greetings.data.first
  end

  def test_retrieve
    greeting_id = 1
    stub_request(:get, "greetings/#{greeting_id}", response: stub_response(fixture: "greetings/retrieve"))
    greeting = Hipcall::Greeting.retrieve(greeting_id:)

    assert_instance_of Hipcall::Objects::Greeting, greeting
    assert_equal 1, greeting.id
  end
end
