class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, :all
    end
    
    # Define your authorization rules here
    # Example:
    # if user.has_role?(:author)
    #   can :create, Post
    #   can :update, Post, user_id: user.id
    # end
  end
end
