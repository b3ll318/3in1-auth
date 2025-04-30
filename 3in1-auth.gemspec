Gem::Specification.new do |spec|
  spec.name          = "3in1-auth"
  spec.version       = "0.1.0"
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]
  spec.summary       = "A combination of Devise, Cancancan, and Rolify for authentication and authorization."
  spec.description   = "This gem provides a comprehensive authentication and authorization solution for Rails applications, integrating Devise, Cancancan, and Rolify functionalities."
  spec.homepage      = "https://github.com/yourusername/3in1-auth"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "README.md", "LICENSE", "Gemfile", "Rakefile"]
  spec.require_paths  = ["lib"]

  spec.add_dependency "devise"
  spec.add_dependency "cancancan"
  spec.add_dependency "rolify"

  # Optional dependencies
  spec.add_dependency "devise_invitable", ">= 2.0.0"
  spec.add_dependency "omniauth", ">= 2.0.0"
  spec.add_dependency "omniauth-rails_csrf_protection" # For security
  
  # Common OAuth providers (optional)
  spec.add_dependency "omniauth-google-oauth2"
  spec.add_dependency "omniauth-github"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
end