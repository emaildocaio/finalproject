Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  resources :companies
  resources :products do
    resources :bookings, only: %i[new create]
  end
  resources :shopping_carts, only: %i[show]
  get '/myproducts', to: 'products#my_index'
end
