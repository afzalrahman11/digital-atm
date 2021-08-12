Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :accounts, only: [:show]
  resources :users, only: [:show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
