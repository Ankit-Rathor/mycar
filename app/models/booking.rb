class Booking < ApplicationRecord
  #enum
  enum :status, {confirmed: 'confirmed', pending: 'pending', cancelled: 'cancelled'}, default: :pending
 #Assosation
  belongs_to :user
  belongs_to :service, optional: true
  belongs_to :car
end
