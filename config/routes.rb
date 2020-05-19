Rails.application.routes.draw do
  root to: "listings#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :profiles
  resources :listings do
    resources :transactions, only: [:new,:create,:show,:edit]
  end
  get "/payments/session", to: "payments#stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  resources :messages, only: [ :new, :create]
  resources :conversations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
