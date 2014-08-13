Rails.application.routes.draw do

  root 'products#index'
  resources :products
  resources :charges, only: [:new, :create]

  resources :users , only: [:show, :edit, :update, :destroy] do
    resources :orders, only: [:show, :edit, :update]
  end

  get '/users/:user_id/orders/:id', to: 'orders#show', as: 'order'
  get '/users/:id/orders_summary', to: 'users#orders_summary', as: 'user_orders_summary'

  resources :line_items, only: [:create, :update, :destroy]

  get '/login', to: 'products#index'
  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

  get '/about', to: 'info#about'

end