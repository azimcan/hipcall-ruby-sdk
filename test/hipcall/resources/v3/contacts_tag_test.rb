require "test_helper"

class ContactsResourceTest < Minitest::Test
  def test_create_tags
    body = { tags: %w[abc def] }
    stub = stub_request("contacts/1/tags", method: :post, body:, response: stub_response(fixture: "contacts/create_tags", status: 200))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    tags = client.contacts.create_tags(contact_id: 1, **body)

    assert_instance_of Hipcall::Collection, tags
    assert_instance_of Hipcall::Tag, tags.data.first
    assert_equal "abc", tags.data.first.name
  end

  def test_delete_tags
    contact_id = 1
    tag_id = 1
    stub = stub_request("contacts/#{contact_id}/tags/#{tag_id}", method: :delete, response: stub_response(fixture: "contacts/delete_tag"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    assert client.contacts.delete_tags(contact_id:, tag_id:)
  end
end
