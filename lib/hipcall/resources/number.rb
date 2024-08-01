module Hipcall
  class Number < Resource
    def self.list(**params)
      response = request(:get, "numbers", params:)
      Collection.from_response(response, type: "Number")
    end

    def self.retrieve(number_id:)
      Objects::Number.new request(:get, "numbers/#{number_id}").body["data"]
    end
  end
end
