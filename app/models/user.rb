class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :teacher, dependent: :destroy
  has_many :bookings

  # Validates Full Name for user signup
  validates :fullname, presence: true, length: { in: 1...150 }

  # Validates email for User signup
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1...75 }

  # Validates password for user sign-up
  validates :password, confirmation: true, presence: true, length: { in: 1...50 }

  # Validates password confirmation for user sign-up
  # validates :password_confirmation

end
