# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying Bookings table"
Booking.destroy_all
puts "destorying Companions table"
Companion.destroy_all
puts "destroying Users table"
User.destroy_all
puts "****"*20
puts "****"*20
puts "****"*20
puts "Creating users...."
puts "****"*20

3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: '#123abc',
    first_name: Faker::FunnyName.name,
    last_name: Faker::Creature::Animal.name
  )
  puts "Created user #{user.id}, with name #{user.first_name} #{user.last_name}"
end

puts "****"*20
puts "Creating companions..."
puts "****"*20

2.times do
  companion = Companion.create(
    price: rand(5..10),
    description: Faker::TvShows::HowIMetYourMother.quote,
    user_id: User.all.sample.id
  )
  puts "Created Companions with their companion id #{companion.id} and user id #{companion.user_id}"
end

puts "****"*20
puts "Creating bookings..."
puts "****"*20

1.times do
  booking = Booking.create(
    # booking_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    # time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    price: Faker::Number.decimal(l_digits: 2),
    user_id: User.all.sample.id,
    companion_id: Companion.all.sample.id,
    accepted: false
  )
   puts "Created Booking with their booking id #{booking.id} | with user id #{booking.user_id} and companion id #{booking.companion_id}"
end
