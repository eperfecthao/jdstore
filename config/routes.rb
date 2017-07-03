Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products, only: [:index, :show]

  namespace :admin do
    resources :products
  end
end
