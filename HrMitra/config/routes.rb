Rails.application.routes.draw do
  root 'home#index'
  
  resources :employees do
    resources :documents
  end

  # Public pages routes
  get 'about-us' => 'pages#about_us'
  get 'contact-us' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-and-conditions' => 'pages#terms_and_conditions'
end