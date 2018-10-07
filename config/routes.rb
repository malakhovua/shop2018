Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  root 'home#index'

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  resources :products do
    get '/likes', to: 'c#a'
    collection do
      get '/likes_collection', to: 'c#a'
      get :my # => /products/my
    end
    member do
      get :details
    end

    resources :comments
    resources :images

  end

end
