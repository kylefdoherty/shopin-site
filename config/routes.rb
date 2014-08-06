Rails.application.routes.draw do

  resources :products

  resources :users , only: [:show, :edit, :update, :destroy] do
    resources :orders, only: [:show, :edit, :update]
  end

  get '/users/:user_id/orders/:id', to: 'orders#show', as: 'order'

  resources :line_items, only: [:create, :update, :destroy]



  root 'products#index'

  get '/login', to: 'products#index'
  get '/logout', to: 'sessions#destroy'

  get '/auth/amazon/callback', to: 'sessions#create'

end