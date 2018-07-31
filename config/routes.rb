Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [
    :omniauth_callbacks,
    :registrations,
    :sessions,
    :passwords,
    :confirmations
  ]
  post '/graphql', to: 'graphql#execute'
end
