class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service, optional: true
  belongs_to :car
end
