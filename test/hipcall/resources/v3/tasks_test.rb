# frozen_string_literal: true

require "test_helper"

class TasksResourceTest < Minitest::Test
  def test_list
    stub = stub_request("tasks", response: stub_response(fixture: "tasks/list"))
    client = Hipcall::Client.new(api_key: "fake", version: "v3", adapter: :test, stubs: stub)
    tasks = client.tasks.list

    assert_instance_of Hipcall::Collection, tasks
    assert_instance_of Hipcall::Task, tasks.data.first
    assert_equal 11, tasks.meta["total"]
  end

  def test_create
    body = { name: "Task Name Two", description: "**bla** bold" }
    stub = stub_request("tasks", method: :post, body:, response: stub_response(fixture: "tasks/create", status: 201))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    task = client.tasks.create(**body)

    assert_instance_of Hipcall::Task, task
    assert_equal "Task Name Two", task.name
  end
end
