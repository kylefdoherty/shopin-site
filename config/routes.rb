Rails.application.routes.draw do

  resources :products

  resources :users , only: [:show, :edit, :update, :destroy] do
    resources :orders, only: [:show, :edit, :update]
  end

  root 'products#index'

  get '/login', to: 'products#index'
  get '/logout', to: 'sessions#destroy'

  get '/auth/amazon/callback', to: 'sessions#create'

end