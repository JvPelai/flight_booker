class Passenger < ApplicationRecord
  validates :name, presence: true, length: {minimum: 6, maximum: 50}
  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 60}, format: { with: VALID_EMAIL_FORMAT}
  before_save { self.email = email.downcase } 
  belongs_to :booking 
  has_one :flight,through: :booking 
end
