Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'homes#index'
  resources :users, only: [:new,:create]

  # post '/sessions/rooms/room_id/trial' => 'rooms#trial',as: 'trial'

  resources :sessions, only: [:new,:create,:destroy] do
    collection do
      resources :rooms do
        post :join 
        patch :start
        patch :wait
      end
    end
  end
end