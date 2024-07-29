module Hipcall
  class Collection
    attr_reader :data, :meta

    def self.from_response(response, key:)
      body = response.body
      new(
        data: body[key].map { |attrs| attrs },
        meta: body["meta"]
      )
    end

    def initialize(data:, meta:)
      @data = data
      @meta = meta
    end
  end
end
