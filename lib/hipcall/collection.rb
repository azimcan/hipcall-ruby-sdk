module Hipcall
  class Collection
    attr_reader :data, :meta

    def self.from_response(response, type:)
      type = "Hipcall::Objects::#{type}".constantize
      body = response.body
      new(
        data: body["data"].map { |attrs| type.new(attrs) },
        meta: body["meta"]
      )
    end

    def initialize(data:, meta:)
      @data = data
      @meta = meta
    end
  end
end
