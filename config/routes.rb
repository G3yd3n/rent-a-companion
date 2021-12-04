Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'companions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  resources :companions do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:index, :show, :destroy]

  get "bookings/:id/pending_status", to: "bookings#status", as: :booking_status
  patch "bookings/:id", to: "bookings#update"
end
