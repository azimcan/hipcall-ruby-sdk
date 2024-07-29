require "test_helper"

class ExtensionsResourceTest < Minitest::Test
  def test_list
    stub = stub_request("extensions", response: stub_response(fixture: "extensions/list"))
    client = Hipcall::Client.new(api_key: "fake", version: "v3", adapter: :test, stubs: stub)
    extensions = client.extensions.list

    assert_instance_of Hipcall::Collection, extensions
    assert_instance_of Hipcall::Extension, extensions.data.first
  end

  def test_retrieve
    extension_id = 1
    stub = stub_request("extensions/#{extension_id}", response: stub_response(fixture: "extensions/retrieve"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    extension = client.extensions.retrieve(extension_id:)

    assert_instance_of Hipcall::Extension, extension
    assert_equal 1, extension.id
  end
end
