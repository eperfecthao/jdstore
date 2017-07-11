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
    resources :orders
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :payment_with_alipay
      post :payment_with_wechat
    end
  end

  namespace :account do
    resources :orders
  end
end
