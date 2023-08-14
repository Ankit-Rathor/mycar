Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  #bookings
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/edit'

  #Address routing
  # get 'addresses/index'
  # get 'addresses/show'
  # get 'addresses/new'
  # get 'addresses/create'
  # get 'addresses/update'
  # get 'addresses/edit'
  # get 'addresses/destroy'

  #cars routing

  # get 'cars/index'
  # get 'cars/show'
  # get 'cars/new'
  # get 'cars/create'
  # get 'cars/update'
  # get 'cars/edit'
  # get 'cars/destroy'

  #users 

  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/update'
  # get 'users/edit'
  # get 'users/destroy'
  
  root to: 'users#index' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :cars, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :addresses, only: [:new, :create, :index, :edit, :update, :show, :destroy]
# resources :sessions
# resources :users
# resources :cars
# resources :addresses
end
