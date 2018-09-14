class Event < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  belongs_to :area
  belongs_to :user
  belongs_to :festival
end
