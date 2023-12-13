class Mission < ApplicationRecord
  belongs_to :listing

  before_create :set_price

  private

  def set_price
    case mission_type
    when 'first_checkin', 'checkout_checkin'
      self.price = 10 * listing.num_rooms
    when 'last_checkout'
      self.price = 5 * listing.num_rooms
    end
  end
end
