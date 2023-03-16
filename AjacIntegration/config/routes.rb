Rails.application.routes.draw do
  root 'objects#index'
  get '/objects/:selected_option', to: 'objects#fetch'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
