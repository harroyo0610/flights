class User < ApplicationRecord
  has_many :flights, through: :user_flights
  has_many :bookings, through: :user_bookings
end
