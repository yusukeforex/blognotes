Rails.application.routes.draw do
  resources :notes

  #routes for users
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  #routes for login form
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #for categories
  resources :categories, except: [:destroy]

  #root
  root to:'users#index'


end
