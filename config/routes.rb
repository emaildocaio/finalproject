Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :companies
  resources :products do
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[index create]
  end
  resources :shopping_carts, only: %i[index]
  resources :bookings, only: %i[edit update destroy]

  # Shopping cart custom routes
  get 'shopping_carts/current', to: 'shopping_carts#show', as: 'current_shopping_cart'
  patch '/shopping_carts/', to: 'shopping_carts#pay', as: 'pay_shopping_cart'

  get '/myproducts', to: 'products#my_index'
end
