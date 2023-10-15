Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "items#index"
  get 'orders', to: "orders#index"

  devise_for :users
  resources :items, only: [:new, :create]
end
