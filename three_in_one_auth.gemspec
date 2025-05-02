require_relative "lib/three_in_one_auth/version"

Gem::Specification.new do |spec|
  spec.name          = "three_in_one_auth"
  spec.version       = ThreeInOneAuth::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = %q{Short summary of your gem}
  spec.description   = %q{A longer description of your gem}
  spec.homepage      = "http://example.com/three_in_one_auth"
  spec.license       = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 6.0"
end