module Hipcall
  class Team < Resource
    def self.list(**params)
      response = request(:get, "teams", params:)
      Collection.from_response(response, type: "Team")
    end

    def self.retrieve(team_id:)
      Objects::Team.new request(:get, "teams/#{team_id}").body["data"]
    end
  end
end
