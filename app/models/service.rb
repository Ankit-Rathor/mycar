class Service < ApplicationRecord
  #Assosiation
  has_many :bookings, dependent: :destroy
end
