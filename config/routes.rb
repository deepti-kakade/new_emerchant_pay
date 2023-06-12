Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users
  resources :merchants, except: [:new, :create]
  resources :transactions
  post "/auth/login", to: "authentication#login"

  root "merchants#index"
end
