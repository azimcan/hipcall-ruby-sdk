# frozen_string_literal: true

# Stripe Ruby bindings
require "forwardable"
require "faraday"
require "faraday_middleware"

# Version
require "hipcall/version"

# API resource support classes
require "hipcall/hipcall_configuration"

# Named API resources
require "hipcall/resource"
require "hipcall/resources/call"
require "hipcall/resources/contact"
require "hipcall/resources/company"

require "hipcall/collection"

module Hipcall
  @config = Hipcall::HipcallConfiguration.setup

  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :version, :version=
    def_delegators :@config, :base_url, :base_url=
    def_delegators :@config, :adapter, :adapter=
    def_delegators :@config, :stubs, :stubs=
  end
end
