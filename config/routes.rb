Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [] do
    resources :products, only: [:index]
  end

  resource :profile, only: [:show]
  resources :products, only: [:show, :new, :create]

  get '/discover', to: 'pages#discover'
end
