Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :products, only:[:index, :new, :create, :destroy]
  resources :clients, only:[:index, :new, :create, :destroy]
  resources :slips do
    member do
      get 'output'
    end
    collection do
      get 'search'
    end
    collection do
      get 'inclimental_search'
    end
  end
end
