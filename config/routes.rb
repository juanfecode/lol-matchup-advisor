Rails.application.routes.draw do
  root "matchups#index"
  resources :recommendations, only: [:create]
  
end
