Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :products, only: [:index, :show, :new, :create]

  get '/discover', to: 'pages#discover'
  get '/profile', to: 'profiles#private_profile', as: :private_profile
  get '/profile/:id', to: 'profiles#public_profile', as: :public_profile
end
