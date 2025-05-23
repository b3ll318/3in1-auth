# README.md for 3in1-auth

# 3in1-auth

3in1-auth is a Ruby gem that combines the functionalities of Devise, Cancancan, and Rolify to provide a comprehensive authentication and authorization solution for your Rails applications. This gem allows you to manage user roles and permissions effectively while offering optional integrations for omniauth and invitation features.

## Features

- **Authentication**: Built on Devise, providing a robust authentication system.
- **Authorization**: Integrates Cancancan for managing user permissions.
- **Role Management**: Utilizes Rolify for handling user roles.
- **Optional Features**: Supports optional integrations for `devise-omniauth` and `devise-invitable`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem '3in1-auth'
```

Then execute:

```bash
bundle install
rails generate three_in_one_auth:install
rails db:migrate
```

This will automatically:
1. Generate necessary initializers and configurations
2. Set up Devise with basic authentication
3. Create a User model with integrated Devise, Rolify, and optional features
4. Create an Ability model for CanCanCan authorization
5. Set up Rolify with a Role model
6. Generate all required migrations

## Generated Components

### User Model
The generator creates a User model with:
- Devise authentication modules
- Rolify integration for role management
- Optional OmniAuth support
- Optional Devise Invitable support

```ruby
class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Additional modules based on configuration
end
```

### Ability Model
A default Ability model for CanCanCan with basic role-based authorization:

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, :all
    end
  end
end
```

### Configuration
The initializer at `config/initializers/three_in_one_auth.rb` allows you to customize:

```ruby
ThreeInOneAuth.setup do |config|
  # Enable/configure OmniAuth providers
  config.enable_omniauth = true
  config.omniauth_providers = {
    google_oauth2: {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET']
    }
  }

  # Enable/configure Devise Invitable
  config.enable_invitable = true
  config.invitable_options = {
    invite_for: 2.weeks,
    invitation_limit: 5
  }
end
```

## Usage

### Role Management
Add roles to users:
```ruby
user.add_role :admin
user.add_role :moderator
```

### Authorization
Use CanCanCan's abilities in your controllers:
```ruby
class ApplicationController < ActionController::Base
  check_authorization
end

class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    # @posts is already loaded and authorized
  end
end
```

Customize permissions in `app/models/ability.rb`:
```ruby
def initialize(user)
  user ||= User.new
  if user.has_role?(:admin)
    can :manage, :all
  elsif user.has_role?(:moderator)
    can :manage, Post
    can :manage, Comment
  else
    can :read, :all
  end
end
```

### Optional Features

#### Adding OmniAuth Support

OmniAuth support is included by default but disabled. To enable it, add the following to your initializer:

```ruby
ThreeInOneAuth.setup do |config|
  config.enable_omniauth = true
  config.omniauth_providers = {
    google_oauth2: {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      options: { scope: 'email,profile' }
    },
    github: {
      client_id: ENV['GITHUB_CLIENT_ID'],
      client_secret: ENV['GITHUB_CLIENT_SECRET']
    }
  }
end
```

#### Adding Invitable Support

Devise Invitable support is included but disabled by default. To enable it:

```ruby
ThreeInOneAuth.setup do |config|
  config.enable_invitable = true
  config.invitable_options = {
    invite_for: 2.weeks,
    invite_key: 'invitation_token',
    invitation_limit: 5,
    validate_on_invite: true
  }
end
```

After enabling either feature, run:

```bash
rails generate three_in_one_auth:install
rails db:migrate
```

This will set up all necessary configurations and migrations for the enabled features.

## Contributing

Bug reports and pull requests are welcome on GitHub at [your-github-repo-url].

## License

This gem is available as open source under the terms of the MIT License.