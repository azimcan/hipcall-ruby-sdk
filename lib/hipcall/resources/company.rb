module Hipcall
  class Company < Resource
    def self.list(**params)
      response = request(:get, "companies", params:)
      Collection.from_response(response, type: "Company")
    end

    def self.create_tags(company_id:, **params)
      response = request(:get, "companies/#{company_id}/tags", params:)
      Collection.from_response(response, type: "Tag")
    end

    def self.delete_tags(company_id:, tag_id:)
      request(:delete, "companies/#{company_id}/tags/#{tag_id}")
    end

    def self.create_comment(company_id:, **params)
      response = request(:post, "companies/#{company_id}/comments", params:)
      Objects::Comment.new response.body["data"]
    end
  end
end
