Rails.application.routes.draw do
  # Define routes for user authentication and authorization
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    invitations: 'users/invitations'
  }

  # Define additional routes for your application here
  # Example: 
  # resources :posts
end