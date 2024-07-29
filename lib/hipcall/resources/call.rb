module Hipcall
  class Call < Resource
    def self.list(**params)
      response = request(method: :get, path: "calls", params:)
      Collection.from_response(response, key: "data", type: Call)
    end

    def retrieve(year:, mounth:, day:, call_uuid:)
      Call.new get_request("calls/#{year}/#{mounth}/#{day}/#{call_uuid}").body["data"]
    end
  end
end
