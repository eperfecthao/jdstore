Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}

  root 'products#index'

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products do
      member do
        post :move_up
        post :move_down
      end
    end
    resources :orders do
      member do
        post :ship
        post :shipped
        post :cancel
        post :return
      end
    end
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
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end
end
