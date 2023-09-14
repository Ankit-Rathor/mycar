class User < ApplicationRecord
  # Authentication
  has_secure_password

  #Association
  has_many :cars
  has_many :bookings, dependent: :destroy
  has_one  :address, dependent: :destroy
  accepts_nested_attributes_for :address
  
  # Enum
  enum :role,{customer:0 , admin:1, mechanic:2}
  #Enum
  enum :status, {confirmed: 'confirmed', pending: 'pending', cancelled: 'cancelled'}, default: :pending
end
