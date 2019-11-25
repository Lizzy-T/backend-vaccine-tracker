Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :vaccines, only: [:index, :show]
  root "welcome#index"
end
