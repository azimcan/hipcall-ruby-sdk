module Hipcall
  class HipcallConfiguration
    attr_accessor :api_key, :version, :base_url, :adapter, :stubs

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def initialize
      @adapter = Faraday.default_adapter
    end
  end
end
