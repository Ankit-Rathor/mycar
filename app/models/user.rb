class User < ApplicationRecord
 #callback validation
  validates :email, uniqueness: true
  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number

  # def mechanic?
  #   self.role.eql?("mechanic")
  # end

  # def customer?
  #   self.role.eql?("customer")
  # end

  # def admin?
  #   self.role.eql?("admin")
  # end

  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 uppercase '
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 lowercase '
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%@#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, ' must contain special character'
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end

  # callback
  # after_update :update

  # Authentication
  has_secure_password

  #Association
  has_many :cars,dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one  :address, dependent: :destroy
  accepts_nested_attributes_for :address
  
  # Enum
  enum :role,{customer:0 , admin:1, mechanic:2}
  #Enum
  enum :status, {confirmed: 'confirmed', pending: 'pending', cancelled: 'cancelled'}, default: :pending
end
