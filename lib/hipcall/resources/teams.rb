module Hipcall
  class Team < Resource
    def list(**params)
      response = get_request("teams", params:)
      Collection.from_response(response, key: "data", type: Team)
    end

    def retrieve(team_id:)
      Team.new get_request("teams/#{team_id}").body["data"]
    end
  end
end
