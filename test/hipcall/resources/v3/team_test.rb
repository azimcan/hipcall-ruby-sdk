require "test_helper"

class TeamTest < Minitest::Test
  def test_list
    stub_request(:get, "teams", response: stub_response(fixture: "teams/list"))
    teams = Hipcall::Team.list

    assert_instance_of Hipcall::Collection, teams
    assert_instance_of Hipcall::Objects::Team, teams.data.first
  end

  def test_retrieve
    team_id = 1
    stub_request(:get, "teams/#{team_id}", response: stub_response(fixture: "teams/retrieve"))
    team = Hipcall::Team.retrieve(team_id:)

    assert_instance_of Hipcall::Objects::Team, team
    assert_equal 1, team.id
  end
end
