Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :items, only: [:new, :create]
end
