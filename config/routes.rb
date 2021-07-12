Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :users do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  end

  get '/auth', to: 'users/sessions#auth'
end
