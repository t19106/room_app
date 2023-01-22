Rails.application.routes.draw do
  get '/search', to: 'searches#search'
  resources :rooms, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :create]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end