Rails.application.routes.draw do
  root "matchups#index"
  resources :recommendations, only: [:create]
  resources :champion_searches, only: [:new, :create] 
end
