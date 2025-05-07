class User < ApplicationRecord
  rolify
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # Enable invitation functionality if configured
  devise :invitable if ThreeInOneAuth.configuration.enable_invitable

  # Enable OmniAuth if configured
  if ThreeInOneAuth.configuration.enable_omniauth
    devise :omniauthable,
           omniauth_providers: ThreeInOneAuth.configuration.omniauth_providers.keys
  end

  # Include default role management
  after_create :assign_default_role

  private

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
