module Hipcall
  class User < Resource
    def self.list(**params)
      response = request(:get, "users", params:)
      Collection.from_response(response, type: "User")
    end

    def self.retrieve(user_id:)
      Objects::User.new request(:get, "users/#{user_id}").body["data"]
    end
  end
end
