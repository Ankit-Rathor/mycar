Rails.application.routes.draw do
  root to: 'users#index' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :cars, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :addresses, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :admins,only: [:new,:index,:create,:edit,:show,:destroy]
  get '/confirm', to: 'bookings#confirm'
  get '/cancel', to: 'bookings#cancel'
  get '/work', to:   'bookings#work'
end
