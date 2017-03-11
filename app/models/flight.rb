class Flight < ApplicationRecord
  has_many :users, through: :user_flights
  has_many :user_flights
  has_many :bookings
end
