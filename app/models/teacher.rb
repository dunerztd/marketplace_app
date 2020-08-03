class Teacher < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :teachers_styles, dependent: :delete_all
  has_many :styles, through: :teachers_styles
end
