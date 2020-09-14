Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :companies
  resources :products do
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[index create]
  end
  resources :shopping_carts, only: %i[index]
  resources :bookings, only: %i[edit update destroy]

  # Company Routes
  namespace :company do
    resources :bookings, only: %i[index show]
    get '/charts/bookings', to: 'bookings#bookings_chart', as: 'bookings_chart'
    get '/charts/products', to: 'bookings#products_chart', as: 'products_chart'
    get '/', to: 'bookings#dashboard', as: 'dashboard'
  end

  # Shopping cart custom routes
  get 'shopping_carts/current', to: 'shopping_carts#show', as: 'current_shopping_cart'
  patch '/shopping_carts/', to: 'shopping_carts#pay', as: 'pay_shopping_cart'

  get '/myproducts', to: 'products#my_index'
  
  # Blazer
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
end




