Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :accounts, only: [:show]
  resources :users, only: [:show]
end
