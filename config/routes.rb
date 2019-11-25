Rails.application.routes.draw do
  resources :vaccines, only: [:index, :show]
  root "welcome#index"
end
