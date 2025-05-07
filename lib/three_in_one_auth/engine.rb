module ThreeInOneAuth
  class Engine < ::Rails::Engine
    isolate_namespace ThreeInOneAuth

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end

    initializer 'three_in_one_auth.setup' do |app|
      # Rails 8 uses Zeitwerk by default, no need to explicitly set it

      # Configure asset pipeline for Rails 8
      if Rails.version >= '8.0'
        app.config.assets.enabled = true
        app.config.assets.use_propshaft = true
      end

      # Configure Devise with Rails 8 compatibility
      Devise.setup do |config|
        config.parent_controller = 'ActionController::Base'
        config.navigational_formats = ['*/*', :html, :turbo_stream, :turbo_frame]
        config.responder.error_status = :unprocessable_entity
        config.responder.redirect_status = :see_other
      end

      # Configure Rolify
      Rolify.configure do |config|
        config.use_dynamic_shortcuts
        config.orm = defined?(Mongoid) ? :mongoid : :active_record
      end

      # Rails 8 HTTP/2 and HTTP/3 support
      if Rails.version >= '8.0'
        app.config.action_dispatch.default_headers.merge!(
          'HTTP3-Version' => 'draft-29',
          'Alt-Svc' => 'h3=":443"; ma=3600'
        )
      end
    end

    # Hook into Rails middleware stack
    initializer 'three_in_one_auth.middleware' do |app|
      if ThreeInOneAuth.configuration.enable_omniauth
        app.middleware.use OmniAuth::Builder do
          ThreeInOneAuth.configuration.omniauth_providers.each do |provider, config|
            provider(provider.to_sym, *config)
          end
        end
      end
    end
  end
end
