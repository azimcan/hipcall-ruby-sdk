require "test_helper"

class UserTest < Minitest::Test
  def test_list
    stub_request(:get, "users", response: stub_response(fixture: "users/list"))
    users = Hipcall::User.list

    assert_instance_of Hipcall::Collection, users
    assert_instance_of Hipcall::Objects::User, users.data.first
    assert_equal 28, users.meta["total"]
  end

  def test_retrieve
    user_id = 2
    stub_request(:get, "users/#{user_id}", response: stub_response(fixture: "users/retrieve"))
    user = Hipcall::User.retrieve(user_id:)

    assert_instance_of Hipcall::Objects::User, user
    assert_equal 2, user.id
  end
end
