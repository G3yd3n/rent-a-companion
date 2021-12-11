Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'companions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  resources :bookings, only: [ :index, :update, :destroy, :show] do
    member do
      get 'accept'
    end
    collection do
      get 'companion'
    end
  end



  resources :companions do
    resources :bookings, only: [ :create, :new ]
  end
end
