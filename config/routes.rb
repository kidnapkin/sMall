Rails.application.routes.draw do
  
  resources :line_items
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :carts
  root 'pages#home'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
