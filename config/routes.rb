Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :products, only:[:new, :create]
  resources :clients, only:[:new, :create]
  resources :slips do
    member do
      get 'output'
    end
  end
end
