require "test_helper"

class TaskTest < Minitest::Test
  def test_list
    stub_request(:get, "tasks", response: stub_response(fixture: "tasks/list"))
    tasks = Hipcall::Task.list

    assert_instance_of Hipcall::Collection, tasks
    assert_instance_of Hipcall::Objects::Task, tasks.data.first
    assert_equal 11, tasks.meta["total"]
  end

  def test_create
    params = { name: "Task Name Two", description: "**bla** bold" }
    stub_request(:post, "tasks", params:, response: stub_response(fixture: "tasks/create", status: 201))
    task = Hipcall::Task.create(**params)

    assert_instance_of Hipcall::Objects::Task, task
    assert_equal "Task Name Two", task.name
  end
end
