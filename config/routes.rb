Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'companions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  resources :companions do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :index, :update, :destroy, :show] do
    member do
      get 'accept'
    end
    collection do
      get 'companion', as: :bookings_as_companion
    end
  end
end
