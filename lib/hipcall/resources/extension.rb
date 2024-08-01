module Hipcall
  class Extension < Resource
    def self.list(**params)
      response = request(:get, "extensions", params:)
      Collection.from_response(response, type: "Extension")
    end

    def self.retrieve(extension_id:)
      Objects::Extension.new request(:get, "extensions/#{extension_id}").body["data"]
    end

    def self.call(extension_id:, **params)
      Objects::Call.new request(:post, "extensions/#{extension_id}/call", params:).body["data"]
    end
  end
end
