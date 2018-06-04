Rails.application.routes.draw do
  devise_for :users
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

