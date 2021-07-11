Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :users, only: [:new, :create], path: '/users/registrations', controller: 'users/registrations'
  # namespace do
  # end
  # get "users/registrations/new", to: "registrations#new", controller: "users/registrations", as: :new_registration
  # get "users/sessions/new", to: "sessions#new", controller: "users/sessions", as: :new_session

  get '/auth/:user_id/:token', to: 'sessions#auth'
end
