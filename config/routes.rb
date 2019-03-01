

Rails.application.routes.draw do

  # config/routes.rb
  mount ActionCable.server => '/cable'

  resources :contacts
  get 'admin' => 'admin#index'



  controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
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


  resources :products do
    get :who_bought, on: :member
  end


  scope "/:locale" do
    resources :orders
  end

  resource  :products
  resources :users
  resources :orders
  resources :line_items
  resources :carts

  root 'home#index', as: 'home_index', via: :all




end
