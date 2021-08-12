Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :users, only: [:show] do
    resources :accounts, only: [:show, :index] do
      resources :transactions, only: [:index, :new, :create]
    end
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
