class Car < ApplicationRecord
  #Assosiation
  belongs_to :user
  has_many :bookings, dependent: :destroy

  #validation
  # validates :number_plate, presence: true, uniqueness: true, format: {with: /\A[A-Z]{2}\d{2}[A-Z]{2}\d{2}\d{4}Z/, message: "is not valid vehicle number"}
end
