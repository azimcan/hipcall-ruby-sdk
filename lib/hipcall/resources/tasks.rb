module Hipcall
  class Task < Resource
    def list(**params)
      response = get_request("tasks", params:)
      Collection.from_response(response, key: "data", type: Task)
    end

    def retrieve(task_id:)
      Task.new get_request("tasks/#{task_id}").body["data"]
    end

    def create(**attributes)
      Task.new post_request("tasks", body: attributes).body["data"]
    end
  end
end
