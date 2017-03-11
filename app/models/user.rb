class User < ApplicationRecord
  has_many :flights, through: :user_flights
  has_many :user_bookings
  has_many :user_flights
  has_many :bookings, through: :user_bookings
  validates :email, uniqueness: true
end
