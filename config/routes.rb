Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "listings#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :profiles
  resources :listings do
    resources :transactions, only: [:new,:create,:show,:update]
  end
  post "/transaction/:id/rating", to: 'transactions#rating', as: 'rating'
  get "/payments/session", to: "payments#stripe_id"
  post "/payments/webhook", to: "payments#webhook"
  resources :messages, only: [ :new, :create]
  resources :conversations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
