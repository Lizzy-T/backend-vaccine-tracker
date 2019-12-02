Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :update, :destroy] 
  
  resources :users, only: [:show] do
    resources :my_vaccines, only: [:index, :create]
  end

  resources :vaccines, only: [:index, :show]
  post '/login', to: 'auth#create'
  root "welcome#index"
end
