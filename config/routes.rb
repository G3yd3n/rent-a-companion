Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:index, :destroy]

  get "bookings/:id/pending", to: "bookings#accept", as: :pending_bookings
  patch "bookings/:id", to: "bookings#update"

  get "bookings/:id/pending", to: "bookings#reject"
  patch "bookings/:id", to: "bookings#update"
end
