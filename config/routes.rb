Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :products, only: [:show, :new, :create]

  get '/discover', to: 'pages#discover'
  get '/profile', to: 'profiles#index' # private profile page
  get '/profile/:id', to: 'profiles#show' # public profile page
end
