module ThreeInOneAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer
        template 'initializer.rb', 'config/initializers/three_in_one_auth.rb'
      end

      def create_user_model
        template 'user.rb', 'app/models/user.rb'
      end

      def create_ability_model
        template 'ability.rb', 'app/models/ability.rb'
      end

      def install_devise
        generate 'devise:install'
        generate 'devise:views'
      end

      def install_rolify
        generate 'rolify:role Role'
      end
    end
  end
end
