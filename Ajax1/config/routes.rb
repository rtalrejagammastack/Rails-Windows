Rails.application.routes.draw do
  root 'opjects#index'
  resources :opjects

  get 'opjects/update_second_select/:first_select_value', to: 'opjects/update_second_select'
    # collection do
    # end
  # end
  # get '/objects/:selected_option', to: 'objects#fetch'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
