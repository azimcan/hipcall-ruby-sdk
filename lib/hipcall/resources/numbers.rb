module Hipcall
  class Number < Resource
    def list(**params)
      response = get_request("numbers", params:)
      Collection.from_response(response, key: "data", type: Number)
    end

    def retrieve(number_id:)
      Number.new get_request("numbers/#{number_id}").body["data"]
    end
  end
end
