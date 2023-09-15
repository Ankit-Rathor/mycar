Rails.application.routes.draw do
  root to: 'users#index' 
  resources :mechanics, only: [:new, :create, :destroy,:index,:edit,:update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :users, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :cars, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :addresses, only: [:new, :create, :index, :edit, :update, :show, :destroy]
  resources :admins,only: [:new,:index,:create,:edit,:show,:destroy,:update]
  resources :services,only: [:new,:index,:create,:edit,:show,:destroy,:update]
  get '/confirm', to: 'bookings#confirm'
  get '/cancel', to: 'bookings#cancel'
  get '/work', to:   'bookings#work'
  get '/assinework', to:   'mechanics#assinework'
  get '/mechanic_booking', to:   'mechanics#mechanic_booking'
  get '/service_history', to:    'services#service_history'
  get '/service_update', to:    'services#service_update'
  get '/user_profile', to:     'users#user_profile'
  get '/dash_board', to:     'users#dash_board'
  get '/confirm', to: 'services#confirm_service'
  get '/cancel_service', to: 'services#cancel_service'
  get '/confirm_service', to: 'services#confirm_service'
  get '/car_all',to: 'cars#car_all'
  get '/view',to: 'mechanics#view'
  get '/admin_profile',to: 'admins#admin_profile'
  get '/admin_navbar',to: 'admins#admin_navbar'
  get '/error',to: 'users#error'

end
