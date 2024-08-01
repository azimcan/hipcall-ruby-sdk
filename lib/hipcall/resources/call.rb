module Hipcall
  class Call < Resource
    def self.list(**params)
      response = request(:get, "calls", params:)
      Collection.from_response(response, type: "Call")
    end

    def self.retrieve(year:, mounth:, day:, call_uuid:)
      Objects::Call.new request(:get, "calls/#{year}/#{mounth}/#{day}/#{call_uuid}").body["data"]
    end
  end
end
