Rails.application.routes.draw do
  get '/', to: 'listings#index'
  root to: "listings#index"
  devise_for :users
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
