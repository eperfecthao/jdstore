Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
  end

  resources :carts

  resources :cart_items do
    collection do
      post :clean
    end
  end
end
