class User < ApplicationRecord
  has_secure_password                     # Default password field


  has_many :cars
  has_many :bookings
  has_one  :address
  enum :role,{customer:0 , manager:1, mechanic:2}
end
