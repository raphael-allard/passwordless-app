Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :users do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end

  # get '/auth/:user_id/:token', to: 'session#auth'
  get '/auth', to: 'users/sessions#auth'
end
