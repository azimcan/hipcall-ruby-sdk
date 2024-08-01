require "test_helper"

class ExtensionTest < Minitest::Test
  def test_list
    stub_request(:get, "extensions", response: stub_response(fixture: "extensions/list"))
    extensions = Hipcall::Extension.list

    assert_instance_of Hipcall::Collection, extensions
    assert_instance_of Hipcall::Objects::Extension, extensions.data.first
  end

  def test_retrieve
    extension_id = 1
    stub_request(:get, "extensions/#{extension_id}", response: stub_response(fixture: "extensions/retrieve"))
    extension = Hipcall::Extension.retrieve(extension_id:)

    assert_instance_of Hipcall::Objects::Extension, extension
    assert_equal 1, extension.id
  end
end
