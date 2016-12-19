Rails.application.routes.draw do
  
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  root 'pages#home'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
