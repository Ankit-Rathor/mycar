Rails.application.routes.draw do
  get 'services/new'
  get 'services/create'
  get 'services/update'
  get 'services/edit'
  get 'services/destroy'
  get 'services/show'
  get 'services/index'
  # get 'mechanics/index'
  # get 'mechanics/show'
  # get 'mechanics/new'
  # get 'mechanics/create'
  # get 'mechanics/update'
  # get 'mechanics/edit'
  # get 'mechanics/destroy'
  root to: 'users#index' 
  resources :mechanics, only: [:new, :create, :destroy,:index,:edit,:update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :cars, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :addresses, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :admins,only: [:new,:index,:create,:edit,:show,:destroy]
  resources :services,only: [:new,:index,:create,:edit,:show,:destroy,:update]
  get '/confirm', to: 'bookings#confirm'
  get '/cancel', to: 'bookings#cancel'
  get '/work', to:   'bookings#work'
  get '/assinework', to:   'mechanics#assinework'
  get '/mechanic_booking', to:   'mechanics#mechanic_booking'
  get '/service_history', to:    'services#service_history'
  get '/service_update', to:    'services#service_update'

  # get '/service_details', to:  'mechanics#service_details'

end
