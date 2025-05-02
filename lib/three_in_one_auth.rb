require 'devise'
require 'cancancan'
require 'rolify'
require "three_in_one_auth/version"

module ThreeInOneAuth
  class << self
    attr_accessor :configuration
  end

  def self.setup
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :enable_omniauth, :omniauth_providers
    attr_accessor :enable_invitable, :invitable_options

    def initialize
      @enable_omniauth = false
      @omniauth_providers = {}
      @enable_invitable = false
      @invitable_options = {}
    end
  end
end

require 'three_in_one_auth/engine' if defined?(Rails)
require 'generators/three_in_one_auth/install/install_generator' if defined?(Rails)
