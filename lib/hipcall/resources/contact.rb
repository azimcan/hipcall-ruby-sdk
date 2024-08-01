module Hipcall
  class Contact < Resource
    def self.list(**params)
      response = request(:get, "contacts", params:)
      Collection.from_response(response, type: "Contact")
    end

    def self.retrieve(contact_id:)
      Objects::Contact.new request(:get, "contacts/#{contact_id}").body["data"]
    end

    def self.create_tags(contact_id:, **params)
      response = request(:post, "contacts/#{contact_id}/tags", params:)
      Collection.from_response(response, type: "Tag")
    end

    def self.delete_tags(contact_id:, tag_id:)
      request(:delete, "contacts/#{contact_id}/tags/#{tag_id}")
    end

    def self.create_comment(contact_id:, **params)
      response = request(:post, "contacts/#{contact_id}/comments", params:)
      Objects::Comment.new response.body["data"]
    end
  end
end
