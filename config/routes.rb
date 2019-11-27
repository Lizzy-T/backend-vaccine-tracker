Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :vaccines, only: [:index, :show]
  post '/login', to: 'auth#create'
  root "welcome#index"
end
