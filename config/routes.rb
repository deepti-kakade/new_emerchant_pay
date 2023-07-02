Rails.application.routes.draw do
  get 'welcome/index'
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_for :merchants
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :merchants, except: [:new, :create]
  resources :transactions
  post "/auth/login", to: "authentication#login"

  devise_scope :admin do
    root to: "devise/sessions#new"
  end
end
