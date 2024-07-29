require "test_helper"

class TeamsResourceTest < Minitest::Test
  def test_list
    stub = stub_request("teams", response: stub_response(fixture: "teams/list"))
    client = Hipcall::Client.new(api_key: "fake", version: "v3", adapter: :test, stubs: stub)
    teams = client.teams.list

    assert_instance_of Hipcall::Collection, teams
    assert_instance_of Hipcall::Team, teams.data.first
  end

  def test_retrieve
    team_id = 1
    stub = stub_request("teams/#{team_id}", response: stub_response(fixture: "teams/retrieve"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    team = client.teams.retrieve(team_id:)

    assert_instance_of Hipcall::Team, team
    assert_equal 1, team.id
  end
end
