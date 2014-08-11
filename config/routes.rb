Rails.application.routes.draw do

  root 'products#index'

  resources :products
  resources :charges, only: [:new, :create]
  resources :users , only: [:show, :edit, :update, :destroy] do
    resources :orders, only: [:show, :edit, :update]
  end
  resources :line_items, only: [:create, :update, :destroy]

  get '/users/:user_id/orders/:id', to: 'orders#show', as: 'order'

  get '/login', to: 'products#index'
  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

end