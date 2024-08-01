require "test_helper"

class NumberTest < Minitest::Test
  def test_list
    stub_request(:get, "numbers", response: stub_response(fixture: "numbers/list"))
    numbers = Hipcall::Number.list

    assert_instance_of Hipcall::Collection, numbers
    assert_instance_of Hipcall::Objects::Number, numbers.data.first
  end

  def test_retrieve
    number_id = 1
    stub_request(:get, "numbers/#{number_id}", response: stub_response(fixture: "numbers/retrieve"))
    number = Hipcall::Number.retrieve(number_id:)

    assert_instance_of Hipcall::Objecs::Number, number
    assert_equal 1, number.id
  end
end
