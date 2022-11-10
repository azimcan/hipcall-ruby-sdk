# frozen_string_literal: true

require "test_helper"

class TasksResourceTest < Minitest::Test
	def test_list
		stub = stub_request("tasks", response: stub_response(fixture: "tasks/list"))
		client = HipcallSdk::Client.new(api_key: "fake", version: "v20211124", adapter: :test, stubs: stub)
		tasks = client.tasks.list
	
		assert_equal HipcallSdk::Collection, tasks.class
		assert_equal HipcallSdk::Task, tasks.data.first.class 
		assert_equal 11, tasks.meta['total']
	end
end
