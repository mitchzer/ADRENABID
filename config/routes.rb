Rails.application.routes.draw do
  # get 'bids/new'
  # get 'bids/create'
  # get 'auctions/index'
  # get 'auctions/show'
  # get 'auctions/new'
  # get 'auctions/create'
  # get 'auctions/edit'
  # get 'auctions/update'
  # get 'auctions/delete'
  # get 'users/create'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show ]
  resources :auctions, only: [ :index, :show, :new, :create, :edit, :update, :delete ] do
    resources :bids, only: [ :new, :create ]
  end

  resources :orders, only: [:create, :show] do
    resources :payments, only: [:new, :create]
  end
end
