Rails.application.routes.draw do
  resources :orders
  resources :reviews
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#home'

  resources :carts
  resources :products
  resources :categories
  resources :line_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
