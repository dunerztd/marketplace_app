class TeachersStyle < ApplicationRecord
  belongs_to :teacher
  belongs_to :style

  # Validation for speciality attribute to exist
  # validates :speciality, presence: true
end
