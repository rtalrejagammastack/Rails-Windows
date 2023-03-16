Rails.application.routes.draw do
  root 'homes#index'
  resources :objects do
    collection do
      get 'update_second_select'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
