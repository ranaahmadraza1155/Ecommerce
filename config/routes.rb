Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
  devise_for :users
  root "catageroys#index"
  resources :products
  resources :catageroys
  resources :carts
  get 'carts/sub/:id', to: 'carts#sub', as: 'sub'
  get 'products/cart/:id', to: 'products#cart', as: 'addcart'
  # get 'carts/show', to: 'cart#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    resources :products
    resources :catageroys
  end
end
