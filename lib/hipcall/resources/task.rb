module Hipcall
  class Task < Resource
    def self.list(**params)
      response = request(:get, "tasks", params:)
      Collection.from_response(response, type: "Task")
    end

    def self.retrieve(task_id:)
      Objects::Task.new request(:get, "tasks/#{task_id}").body["data"]
    end

    def self.create(**params)
      Objects::Task.new request(:post, "tasks", params:).body["data"]
    end
  end
end
