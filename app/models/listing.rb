class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :missions, dependent: :destroy
end

# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :listing
end

# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :listing
end
