Resume::Application.routes.draw do
  resources :docs
  resources :users
  resources :user_sessions
  get "downloads/index"
  get "downloads/download"

  get 'download', to: 'downloads#index',       as: :download
  get 'login',    to: 'user_sessions#new',     as: :login
  get 'logout',   to: 'user_sessions#destroy', as: :logout
  
  #root :to => 'docs#index'
  root :to => 'user_sessions#new'
end
