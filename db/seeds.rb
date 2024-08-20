# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Offer.destroy_all
User.destroy_all

puts "creating 5 users"
user1 = User.create!(username: "Carlos Yuggernaut", email: "a@a.com", password: "2309hyr")
user2 = User.create!(username: "Boluos Yuggernaut", email: "b@b.com", password: "a23yar")
user3 = User.create!(username: "Gurt Yuggernaut", email: "c@c.com", password: "209hyr")
user4 = User.create!(username: "brilliant Yuggernaut", email: "d@d.com", password: "209hyasdadsr")
user5 = User.create!(username: "lwui Yuggernaut", email: "e@e.com", password: "20af9hyr")

puts "finished creating 5 users"

puts "creating 5 plants"
Offer.create!(plant_name: "Blue cactus", status: true, price: 50.00, plant_description: "blue", user: user1)
Offer.create!(plant_name: "red cactus", status: true, price: 50.50, plant_description: "red", user: user2)
Offer.create!(plant_name: "yellow cactus", status: true, price: 50.30, plant_description: "yellow", user: user3)
Offer.create!(plant_name: "black cactus", status: true, price: 50.20, plant_description: "black", user: user4)
Offer.create!(plant_name: "orange cactus", status: true, price: 50.10, plant_description: "orange", user: user5)
