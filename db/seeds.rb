# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
Booking.delete_all
Reservation.delete_all
Listing.delete_all
Mission.delete_all

Listing.create!(num_rooms: 2)
Listing.create!(num_rooms: 1)
Listing.create!(num_rooms: 3)

Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date)
Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Booking.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-20".to_date)

Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-11".to_date, end_date: "2016-10-13".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-13".to_date, end_date: "2016-10-15".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Reservation.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-18".to_date)

# db/seeds.rb
Booking.delete_all
Reservation.delete_all
Listing.delete_all
Mission.delete_all

listing1 = Listing.create!(num_rooms: 2)
listing2 = Listing.create!(num_rooms: 1)

booking1 = Booking.create!(listing_id: listing1.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date)
reservation1 = Reservation.create!(listing_id: listing1.id, start_date: "2016-10-11".to_date, end_date: "2016-10-13".to_date)

Mission.create!(listing_id: listing1.id, mission_type: 'first_checkin', date: booking1.start_date, price: 20)
Mission.create!(listing_id: listing1.id, mission_type: 'last_checkout', date: booking1.end_date, price: 10)
Mission.create!(listing_id: listing1.id, mission_type: 'checkout_checkin', date: reservation1.end_date, price: 20)
