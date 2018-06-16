Rails.application.routes.draw do
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
      get :my
    end
    member do
      get :details
    end

    resources :comments
  end


end
