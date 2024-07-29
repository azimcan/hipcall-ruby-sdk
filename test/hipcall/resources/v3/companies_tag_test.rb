require "test_helper"

class CompaniesResourceTest < Minitest::Test
  def test_create_tags
    body = { tags: %w[abc def] }
    stub = stub_request("companies/1/tags", method: :post, body:, response: stub_response(fixture: "companies/create_tags", status: 200))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    tags = client.companies.create_tags(company_id: 1, **body)

    assert_instance_of Hipcall::Collection, tags
    assert_instance_of Hipcall::Tag, tags.data.first
    assert_equal "abc", tags.data.first.name
  end

  def test_delete_tags
    company_id = 1
    tag_id = 1
    stub = stub_request("companies/#{company_id}/tags/#{tag_id}", method: :delete, response: stub_response(fixture: "companies/delete_tag"))
    client = Hipcall::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    assert client.companies.delete_tags(company_id:, tag_id:)
  end
end
