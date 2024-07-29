# frozen_string_literal: true

require "test_helper"

class CallsResourceTest < Minitest::Test
  def test_list
    stub = stub_request("calls", response: stub_response(fixture: "calls/list"))
    Hipcall.api_key = "fake"
    Hipcall.version = "v3"
    Hipcall.adapter = :test
    Hipcall.stubs = stub

    calls = Hipcall::Call.list

    assert_instance_of Hipcall::Collection, calls
    assert_instance_of Hipcall::Call, calls.data.first
  end

  def test_retrieve
    year = 2022
    mounth = 0o7
    day = 0o7
    call_uuid = "caedfd1b-25ec-447e-ad87-3b7eb3d358ea"
    stub = stub_request("calls/#{year}/#{mounth}/#{day}/#{call_uuid}", response: stub_response(fixture: "calls/retrieve"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    call = client.calls.retrieve(year:, mounth:, day:, call_uuid:)

    assert_instance_of Hipcall::Call, call
    assert_equal "caedfd1b-25ec-447e-ad87-3b7eb3d358ea", call.uuid
  end
end
