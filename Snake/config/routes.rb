Rails.application.routes.draw do
  root 'home#index'

  post '/user' => 'home#create'
  get 'log_out' => 'home#destroy' , as: 'log_out'

  get 'join_game' => 'games#index' , as: 'join_game'
end
