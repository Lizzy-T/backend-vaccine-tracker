Rails.application.routes.draw do

  resources :users, only: [:index, :create, :update, :destroy] 
  
  resources :my_vaccines, only: [:index, :create]
  
  resources :vaccines, only: [:index, :show]
  
  get '/profile', to: 'users#show'
  post '/login', to: 'auth#create'

  root "welcome#index"
end
