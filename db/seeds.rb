require 'faker'
require "open-uri"

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
cities = ["Paris", "London", "Lisbon", "Rome", "Berlin", "Madrid", "Barcelona", "Amsterdam", "Brussels", "Vienna", "Barcelona", "Amsterdam", "Rotterdam", "Utrecht"]

puts "Creating caterers..."

caterer1 = Caterer.create!(name: Faker::Restaurant.name, address: cities.sample, cuisine: cuisines.sample, description: Faker::Restaurant.description,
  price_per_hour: 50, user: any)
file1 = URI.open("https://source.unsplash.com/random/?#{caterer1.cuisine}+food")
caterer1.photo.attach(io: file1, filename: "image1.png", content_type: "image/png")

file2 = URI.open("https://source.unsplash.com/random/?#{caterer1.cuisine}+food")
caterer2 = Caterer.create!(name: Faker::Restaurant.name, address: cities.sample, cuisine: cuisines.sample,

                           description: Faker::Restaurant.description, price_per_hour: 60, user: marie)
caterer2.photo.attach(io: file2, filename: "image2.png", content_type: "image/png")

caterers = [caterer1, caterer2]
20.times do
  puts "Creating users..."
  user1 = User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
    users << user1

    puts "Creating caterers..."


  file = URI.open("https://source.unsplash.com/random/?#{caterer1.cuisine}+food")
  caterer = Caterer.create!(name: Faker::Restaurant.name, address: cities.sample, cuisine: cuisines.sample,

                            description: Faker::Restaurant.description, price_per_hour: 50, user: user1)
  caterer.photo.attach(io: file, filename: "#{caterer.name}-image.png", content_type: "image/png")
  caterers << caterer
end

puts "Creating bookings..."

10.times do
  start_time = Faker::Time.forward(days: 23)
  end_hour = start_time + 4.hours
  bookingCaterer = caterers.sample
  Booking.create!(date: Faker::Date.forward(days: 23), location: cities.sample,
                  start_hour: start_time, end_hour:,
                  total_price: bookingCaterer.price_per_hour * (end_hour - start_time), confirmed: false, user: users.sample, caterer: bookingCaterer, guests_count: 10)
end

5.times do
  start_time = Faker::Time.forward(days: 23)
  end_hour = start_time + 4.hours
  bookingCaterer = caterers.sample
  Booking.create!(date: Faker::Date.forward(days: 23), location: cities.sample,
                  start_hour: start_time, end_hour:,
                  total_price: bookingCaterer.price_per_hour * (end_hour - start_time), confirmed: false, user: any, caterer: bookingCaterer, guests_count: 10)
end
