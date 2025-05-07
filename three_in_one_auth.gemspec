require_relative 'lib/three_in_one_auth/version'

Gem::Specification.new do |spec|
  spec.name          = 'three_in_one_auth'
  spec.version       = ThreeInOneAuth::VERSION
  spec.authors       = ['Your Name']
  spec.email         = ['your.email@example.com']
  spec.summary       = 'A combination of Devise, Cancancan, and Rolify for authentication and authorization'
  spec.description   = 'This gem provides a comprehensive authentication and authorization solution for Rails applications, integrating Devise, Cancancan, and Rolify functionalities'
  spec.homepage      = 'https://github.com/yourusername/three_in_one_auth'
  spec.license       = 'MIT'

  spec.files         = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.2.0' # Rails 8 requires Ruby 3.2+

  spec.add_dependency 'cancancan', '~> 3.5'
  spec.add_dependency 'devise', '~> 4.9'
  spec.add_dependency 'propshaft', '~> 0.8' # Rails 8 asset pipeline
  spec.add_dependency 'rails', '>= 6.1', '< 9.0' # Supporting Rails 8.x
  spec.add_dependency 'rolify', '~> 6.0'

  # Optional dependencies
  spec.add_dependency 'devise_invitable', '~> 2.0', '>= 2.0.0'
  spec.add_dependency 'omniauth', '~> 2.0', '>= 2.0.0'
  spec.add_dependency 'omniauth-rails_csrf_protection', '~> 1.0'

  # Common OAuth providers (optional)
  spec.add_dependency 'omniauth-github', '~> 2.0'
  spec.add_dependency 'omniauth-google-oauth2', '~> 1.1'

  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.75'
end
