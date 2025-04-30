module ThreeInOneAuth
  class Engine < ::Rails::Engine
    isolate_namespace ThreeInOneAuth

    initializer 'three_in_one_auth.setup' do |app|
      if ThreeInOneAuth.configuration.enable_omniauth
        require 'omniauth'
        require 'omniauth-rails_csrf_protection'
      end

      if ThreeInOneAuth.configuration.enable_invitable
        require 'devise_invitable'
      end
    end
  end
end
