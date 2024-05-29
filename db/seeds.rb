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

puts "Creating caterers..."

file1 = URI.open("https://www.google.com/search?q=food+caterer+image&sca_esv=99636c5107a06ae2&sca_upv=1&udm=2&biw=1536&bih=730&ei=EAhXZryeLv7bi-gPm_yu-QU&ved=0ahUKEwi85sb217KGAxX-7QIHHRu-K18Q4dUDCBA&uact=5&oq=food+caterer+image&gs_lp=Egxnd3Mtd2l6LXNlcnAiEmZvb2QgY2F0ZXJlciBpbWFnZUiPKVDQA1ivJ3ABeACQAQCYAZABoAHqCqoBBDE2LjK4AQPIAQD4AQGYAg2gAu8HwgIKEAAYgAQYQxiKBcICBRAAGIAEwgIGEAAYBRgewgIGEAAYCBgewgIEEAAYHsICBxAAGIAEGBjCAgkQABiABBgYGAqYAwCIBgGSBwQxMi4xoAfLSQ&sclient=gws-wiz-serp#vhid=96v1LpkxRrjcDM&vssid=mosaic")
caterer1 = Caterer.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, cuisine: cuisines.sample, description: Faker::Restaurant.description,
                           price_per_hour: 50, user: any)
caterer1.photo.attach(io: file1, filename: "image1.png", content_type: "image/png")

file2 = URI.open("https://media.istockphoto.com/id/1056074028/photo/waiter-carrying-plates-with-meat-dish.jpg?s=612x612&w=0&k=20&c=KJ098Ql4Pf0uTGfiKKrdqB6PNdnh7JuUmJo1fYVvUxc=")
caterer2 = Caterer.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, cuisine: cuisines.sample,

                           description: Faker::Restaurant.description, price_per_hour: 60, user: marie)
caterer2.photo.attach(io: file2, filename: "image2.png", content_type: "image/png")

caterers = [caterer1, caterer2]
20.times do
  puts "Creating users..."
  user1 = User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name)
  users << user1

  puts "Creating caterers..."

  file = URI.open("https://foodtrends.com/wp-content/uploads/2023/06/menu-page-bg.jpg")
  caterer = Caterer.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, cuisine: cuisines.sample,

                            description: Faker::Restaurant.description, price_per_hour: 50, user: user1)
  caterer.photo.attach(io: file, filename: "#{caterer.name}-image.png", content_type: "image/png")
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
