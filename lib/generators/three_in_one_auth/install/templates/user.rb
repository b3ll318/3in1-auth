class User < ApplicationRecord
  rolify
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enable invitation module if configured
  devise :invitable if ThreeInOneAuth.configuration.enable_invitable

  # Enable omniauthable if configured
  devise :omniauthable, omniauth_providers: ThreeInOneAuth.configuration.omniauth_providers.keys if ThreeInOneAuth.configuration.enable_omniauth
end
