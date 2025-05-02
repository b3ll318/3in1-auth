require "three_in_one_auth/version"
require "three_in_one_auth/engine"

module ThreeInOneAuth
  class << self
    attr_accessor :configuration
  end

  def self.setup
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    # Add your configuration options here
    # For example:
    # attr_accessor :some_option
  end
end
