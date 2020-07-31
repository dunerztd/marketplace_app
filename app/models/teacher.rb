class Teacher < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :styles, dependent: :destroy
end
