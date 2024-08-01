module Hipcall
  class Greeting < Resource
    def self.list(**params)
      response = request(:get, "greetings", params:)
      Collection.from_response(response, type: "Greeting")
    end

    def self.retrieve(greeting_id:)
      Objects::Greeting.new request(:get, "greetings/#{greeting_id}").body["data"]
    end
  end
end
