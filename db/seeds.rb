require 'faker'

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all
Caterer.destroy_all

cuisines = ["French", "Italian", "Portuguese", "English"]
puts "Creating users..."

any = User.create!(email: "anyelle@mail.com", password: "password", first_name: "Anyelle", last_name: "Zanatta")
marie = User.create!(email: "marie@mail.com", password: "password", first_name: "Marie", last_name: "Auer")
matilda = User.create!(email: "matilda@mail.com", password: "password", first_name: "matilda", last_name: "hello")
pari = User.create!(email: "parikaya@mail.com", password: "password", first_name: "parikaya", last_name: "nanda")

users = [any, marie, matilda, pari]

puts "Creating caterers..."
caterer1 = Caterer.create!(address: Faker::Address.full_address, cuisine: cuisines.sample, description: Faker::Restaurant.description,
                           price_per_hour: 50, user: any)
caterer2 = Caterer.create!(address: Faker::Address.full_address, cuisine: cuisines.sample,
                           description: Faker::Restaurant.description, price_per_hour: 60, user: marie)
caterers = [caterer1, caterer2]
20.times do
  puts "Creating users..."
  user1 = User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name)
  users << user1

  puts "Creating caterers..."
  caterer = Caterer.create!(address: Faker::Address.full_address, cuisine: cuisines.sample,
                            description: Faker::Restaurant.description, price_per_hour: 50, user: user1)

  caterers << caterer
end

puts "Creating bookings..."

10.times do
  start_time = Faker::Time.forward(days: 23)
  end_hour = start_time + 4.hours
  bookingCaterer = caterers.sample
  Booking.create!(date: Faker::Date.forward(days: 23), location: Faker::Address.full_address,
                  start_hour: start_time, end_hour:,
                  total_price: bookingCaterer.price_per_hour * (end_hour - start_time), confirmed: false, user: users.sample, caterer: bookingCaterer, guests_count: 10)
end
