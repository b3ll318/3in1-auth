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

```
bundle install
```

## Usage

To use 3in1-auth in your application, follow the setup instructions provided in the documentation for each integrated library (Devise, Cancancan, Rolify).

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