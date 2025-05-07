require 'three_in_one_auth/version'
require 'three_in_one_auth/engine'
require 'devise'
require 'cancancan'
require 'rolify'
require 'propshaft' if Rails.version >= '8.0'

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
                  :enable_invitable, :invitable_options,
                  :turbo_enabled, :hotwire_enabled,
                  :http3_enabled, :use_propshaft

    def initialize
      @enable_omniauth = false
      @omniauth_providers = {}
      @enable_invitable = false
      @invitable_options = {
        invite_for: 2.weeks,
        invitation_limit: 5
      }
      @turbo_enabled = true
      @hotwire_enabled = true
      @http3_enabled = Rails.version >= '8.0'  # Enable HTTP/3 by default in Rails 8
      @use_propshaft = Rails.version >= '8.0'  # Use Propshaft by default in Rails 8
    end
  end
end
