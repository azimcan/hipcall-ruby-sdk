# frozen_string_literal: true

require "test_helper"

class CallTest < Minitest::Test
  def test_list
    stub_request(:get, "calls", response: stub_response(fixture: "calls/list"))

    calls = Hipcall::Call.list

    assert_instance_of Hipcall::Collection, calls
    assert_instance_of Hipcall::Objects::Call, calls.data.first
  end

  def test_retrieve
    year = 2022
    mounth = 0o7
    day = 0o7
    call_uuid = "caedfd1b-25ec-447e-ad87-3b7eb3d358ea"
    stub_request(:get, "calls/#{year}/#{mounth}/#{day}/#{call_uuid}", response: stub_response(fixture: "calls/retrieve"))
    call = Hipcall::Call.retrieve(year:, mounth:, day:, call_uuid:)

    assert_instance_of Hipcall::Objects::Call, call
    assert_equal "caedfd1b-25ec-447e-ad87-3b7eb3d358ea", call.uuid
  end
end
