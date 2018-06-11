Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: 'pages#home'
  get '/', to: 'pages#home'
  get '/info', to: 'pages#info'
  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show ]
  resources :auctions, only: [ :index, :show, :new, :create, :edit, :update, :destroy ] do
    resources :bids, only: [ :new, :create ]
  end

  resources :orders, only: [:new, :create, :show] do
    resources :payments, only: [:new, :create]
  end
  # resources :products
end
