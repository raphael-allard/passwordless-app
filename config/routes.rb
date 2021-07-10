Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :users, only: [:new, :create], path: '/users/registrations', controller: 'users/registrations'
end
