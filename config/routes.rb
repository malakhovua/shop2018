Rails.application.routes.draw do
  root 'home#index'


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
