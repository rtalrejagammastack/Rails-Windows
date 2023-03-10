Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new,:create,:destroy]
  # get "rooms#index"

  get 'rooms/:id/start' => 'rooms#start',as: 'start_room'

  resources :rooms do
    member do
      post 'join'
    end
    collection do
      delete 'leave'
    end
    # post "join",on: :member
    # delete "leave",on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
