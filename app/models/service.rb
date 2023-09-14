class Service < ApplicationRecord
  #enum
  enum :status, {confirm: 'confirm', pending: 'pending', cancelled: 'cancelled'}, default: :pending  
  #Assosiation
  has_many :bookings, dependent: :destroy
end
