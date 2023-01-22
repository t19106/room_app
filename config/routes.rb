Rails.application.routes.draw do
  resources :rooms, only: [:index, :new, :create]
  resources :users, only: [:index, :create]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end