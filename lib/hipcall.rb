# frozen_string_literal: true

# Hipcall Ruby bindings
require "faraday"

# Version
require "hipcall/version"

# API resource support classes
require "hipcall/hipcall_configuration"

# Named API resources
require "hipcall/resource"
require "hipcall/resources/call"
require "hipcall/resources/company"
require "hipcall/resources/contact"
require "hipcall/resources/extension"
require "hipcall/resources/greeting"
require "hipcall/resources/number"
require "hipcall/resources/task"
require "hipcall/resources/team"
require "hipcall/resources/user"

# Objects
require "hipcall/object"
require "hipcall/objects/call"
require "hipcall/objects/company"
require "hipcall/objects/contact"
require "hipcall/objects/extension"
require "hipcall/objects/greeting"
require "hipcall/objects/number"
require "hipcall/objects/tag"
require "hipcall/objects/task"
require "hipcall/objects/team"
require "hipcall/objects/user"

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
