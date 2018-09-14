class User < ApplicationRecord
  has_many :festivals, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments, dependent: :destroy
  has_many :festivals, through: :assignments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  has_secure_password


  def admin?(festival)
    admin = Role.find(1)
    self.roles.include?(admin) && self.festivals.include?(festival)
  end

  def managed_festivals
    self.festivals.select do |f|
      f.admin == self
    end
  end

  def saved_events(festival)
    bookings = self.bookings.select do |b|
      booking.event.festival_id == festival.id
    end
    bookings.map do |b|
      booking.event
    end
  end

  def booked_events(festival)
    bookings = self.bookings.select do |b|
      booking.event.festival_id == festival.id && booking.booked == true
    end
    bookings.map do |b|
      booking.event
    end
  end

end
