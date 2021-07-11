Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :users do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end

  # get '/auth/:user_id/:token', to: 'sessions#auth', controller: 'users/registrations'
end
