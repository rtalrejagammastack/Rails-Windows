Rails.application.routes.draw do
  root 'pages#index'

  resources :sessions, only: [:new,:create,:destroy]
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
