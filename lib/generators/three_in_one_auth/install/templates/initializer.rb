ThreeInOneAuth.setup do |config|
  # OmniAuth configuration
  config.enable_omniauth = false
  config.omniauth_providers = {
    # Uncomment and configure as needed
    # google_oauth2: {
    #   client_id: ENV['GOOGLE_CLIENT_ID'],
    #   client_secret: ENV['GOOGLE_CLIENT_SECRET']
    # }
  }

  # Devise Invitable configuration
  config.enable_invitable = false
  config.invitable_options = {
    invite_for: 2.weeks,
    invitation_limit: 5
  }
end

# Devise Configuration
Devise.setup do |config|
  config.mailer_sender = 'please-change-me@example.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
