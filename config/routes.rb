Rails.application.routes.draw do
  resources :orders, only: [:new, :create]
  resources :reviews, only: [:new, :create, :update]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#home'

  resources :carts
  resources :products, except: [:new, :edit]
  resources :categories, only: [:show, :create, :index]
  resources :line_items, only: [:create, :destroy]

end
