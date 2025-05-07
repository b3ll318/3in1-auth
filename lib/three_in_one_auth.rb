require "three_in_one_auth/version"
require "three_in_one_auth/engine"
require "devise"
require "cancancan"
require "rolify"

module ThreeInOneAuth
  class << self
    attr_accessor :configuration
  end

  def self.setup
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :enable_omniauth, :omniauth_providers, 
                  :enable_invitable, :invitable_options

    def initialize
      @enable_omniauth = false
      @omniauth_providers = {}
      @enable_invitable = false
      @invitable_options = {
        invite_for: 2.weeks,
        invitation_limit: 5
      }
    end
  end
end
