Rails.application.routes.draw do
  get '/search', to: 'searches#search'
  resources :rooms, only: [:index, :new, :create, :show]
  resources :reservations, only: [:index, :new, :create]
  namespace :reservations do
    post :confirmation
  end
  resources :users, only: [:index, :create, :edit, :update]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end