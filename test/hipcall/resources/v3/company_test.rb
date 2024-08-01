require "test_helper"

class CompanyTest < Minitest::Test
  def test_create_tags
    params = { tags: %w[abc def] }
    stub_request(:post, "companies/1/tags", params:, response: stub_response(fixture: "companies/create_tags", status: 200))
    tags = Hipcall::Company.create_tags(company_id: 1, **params)

    assert_instance_of Hipcall::Collection, tags
    assert_instance_of Hipcall::Objects::Tag, tags.data.first
    assert_equal "abc", tags.data.first.name
  end

  def test_delete_tags
    company_id = 1
    tag_id = 1
    stub_request(:delete, "companies/#{company_id}/tags/#{tag_id}", response: stub_response(fixture: "companies/delete_tag"))

    assert Hipcall::Company.delete_tags(company_id:, tag_id:)
  end
end
