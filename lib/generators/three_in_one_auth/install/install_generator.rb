module ThreeInOneAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        if Rails.version >= '8.0'
          Time.now.utc.strftime('%Y%m%d%H%M%S')
        else
          format('%.3d', next_migration_number)
        end
      end

      def create_initializer
        template 'initializer.rb', 'config/initializers/three_in_one_auth.rb'
      end

      def install_devise
        generate 'devise:install'
        generate 'devise:views'
        generate 'devise User'
      end

      def create_user_model
        template 'user.rb', 'app/models/user.rb', force: true
      end

      def create_ability_model
        template 'ability.rb', 'app/models/ability.rb'
      end

      def setup_rolify
        # Create the Role model
        template 'role.rb', 'app/models/role.rb'

        # Create rolify migration
        migration_template(
          'rolify_migration.rb',
          'db/migrate/rolify_create_roles.rb',
          migration_version: migration_version
        )
      end

      private

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if Rails::VERSION::MAJOR >= 5
      end
    end
  end
end
