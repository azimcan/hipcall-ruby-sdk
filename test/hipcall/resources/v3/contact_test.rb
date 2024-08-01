require "test_helper"

class ContactTest < Minitest::Test
  def test_create_tags
    params = { tags: %w[abc def] }
    stub_request(:post, "contacts/1/tags", params:, response: stub_response(fixture: "contacts/create_tags", status: 200))
    tags = Hipcall::Contact.create_tags(contact_id: 1, **params)

    assert_instance_of Hipcall::Collection, tags
    assert_instance_of Hipcall::Objects::Tag, tags.data.first
    assert_equal "abc", tags.data.first.name
  end

  def test_delete_tags
    contact_id = 1
    tag_id = 1
    stub_request(:delete, "contacts/#{contact_id}/tags/#{tag_id}", response: stub_response(fixture: "contacts/delete_tag"))

    assert Hipcall::Contact.delete_tags(contact_id:, tag_id:)
  end
end
