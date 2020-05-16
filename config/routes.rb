Rails.application.routes.draw do
  root to: "listings#index"
  devise_for :users
  resources :profiles
  resources :listings
  resources :messages, only: [ :new, :create]
  resources :conversations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
