Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :products, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get '/discover', to: 'pages#discover'
  get '/profiles', to: 'profiles#profiles', as: :creators
  get '/profile', to: 'profiles#private_profile', as: :private_profile
  # get '/profile/:id', to: 'profiles#public_profile', as: :public_profile
  post '/profile', to: 'products#scrape'


  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # get '/:store_url', to: 'profiles#public_profile', as: :public_profile

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :show_products ] do
        resources :products, only: [:index]
      end
    end
  end


end
