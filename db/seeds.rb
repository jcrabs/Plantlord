# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'faker'
require "open-uri"

booking_status = %w[Pending Active Rejected Expired]
# img_height = 320
# img_width = 320
# url = URI.open("https://loremflickr.com/#{img_width}/#{img_height}/")

# This code deletes all images stored on Cloudinary

# resources = Cloudinary::Api.resources(max_results: 500) # adjust max_results if needed
# puts "Destroying ALL cloudinary images!"
# resources['resources'].each do |resource|
#   public_id = resource['public_id']
#   puts "Deleting #{public_id}..."
#   Cloudinary::Uploader.destroy(public_id)
# end
# puts "All images deleted from Cloudinary."

puts "Destroying all Bookings!"
Booking.destroy_all
puts "Destroying all Offers!"
Offer.destroy_all
puts "Destroying all Users!"
User.destroy_all

puts "Creating 20 unique users!"
User.create!(username: "Carlos Yuggernaut", email: "a@a.com", password: "password", street: "Rudi Dutschke Straße 33", city: "Berlin", state: "Berlin", country: "Germany", zip: 10969)
User.create!(username: "Emily Waters", email: "emily.waters@example.com", password: "password", street: "221B Baker Street", city: "London", state: "London", country: "UK", zip: 434342)
User.create!(username: "Kenji Sato", email: "kenji.sato@example.jp", password: "password", street: "1 Chome-1-2 Oshiage", city: "Sumida", state: "Tokyo", country: "Japan", zip: 1310045)
User.create!(username: "Maria Sanchez", email: "maria.s@example.es", password: "password", street: "Calle de Alcalá 45", city: "Madrid", state: "Madrid", country: "Spain", zip: 28014)
User.create!(username: "John Doe", email: "jdoe@example.com", password: "password", street: "1600 Pennsylvania Avenue NW", city: "Washington", state: "DC", country: "USA", zip: 20500)
User.create!(username: "Isabella Rossi", email: "isabella.rossi@example.it", password: "password", street: "Via del Corso 501", city: "Rome", state: "Lazio", country: "Italy", zip: 033201)
User.create!(username: "Pierre Dubois", email: "pierre.dubois@example.fr", password: "password", street: "10 Avenue des Champs-Élysées", city: "Paris", state: "Île-de-France", country: "France", zip: 75008)
User.create!(username: "Lara Croft", email: "lcroft@example.com", password: "password", street: "123 Raider Street", city: "London", state: "Greater London", country: "UK", zip: 53344)
User.create!(username: "Ankit Patel", email: "ankit.patel@example.in", password: "password", street: "MG Road", city: "Mumbai", state: "Maharashtra", country: "India", zip: 400001)
User.create!(username: "Olga Ivanova", email: "olga.ivanova@example.ru", password: "password", street: "Tverskaya Street 10", city: "Moscow", state: "Moscow", country: "Russia", zip: 125009)
User.create!(username: "Li Wei", email: "li.wei@example.cn", password: "password", street: "1 Tiananmen East Road", city: "Beijing", state: "Beijing", country: "China", zip: 100000)
User.create!(username: "Sophia Smith", email: "sophia.smith@example.ca", password: "password", street: "100 Queen Street", city: "Toronto", state: "Ontario", country: "Canada", zip: 3423)
User.create!(username: "Ahmed Al-Farsi", email: "ahmed.farsi@example.ae", password: "password", street: "Sheikh Zayed Road", city: "Dubai", state: "Dubai", country: "UAE", zip: 00000)
User.create!(username: "Marta Nowak", email: "marta.nowak@example.pl", password: "password", street: "Nowy Świat 15", city: "Warsaw", state: "Mazowieckie", country: "Poland", zip: 00372)
User.create!(username: "Hassan Ali", email: "hassan.ali@example.pk", password: "password", street: "Mall Road", city: "Lahore", state: "Punjab", country: "Pakistan", zip: 54000)
User.create!(username: "Anna Müller", email: "anna.mueller@example.de", password: "password", street: "Marienplatz 1", city: "Munich", state: "Bavaria", country: "Germany", zip: 80331)
User.create!(username: "Carlos Diaz", email: "carlos.diaz@example.mx", password: "password", street: "Paseo de la Reforma 100", city: "Mexico City", state: "CDMX", country: "Mexico", zip: 06600)
User.create!(username: "Yasmine El-Sayed", email: "yasmine.sayed@example.eg", password: "password", street: "Al Tahrir Square", city: "Cairo", state: "Cairo", country: "Egypt", zip: 11511)
User.create!(username: "Lucas Silva", email: "lucas.silva@example.br", password: "password", street: "Avenida Paulista 900", city: "São Paulo", state: "São Paulo", country: "Brazil", zip: 01310100)
User.create!(username: "Emily Wilson", email: "emily.wilson@example.au", password: "password", street: "1 Macquarie Street", city: "Sydney", state: "NSW", country: "Australia", zip: 2000)
puts "Finished creating #{User.count} users!"

puts "Attaching cat images to users!"
resources = Cloudinary::Api.resources(prefix: 'cats', type: 'upload', max_results: 20)
  if resources['resources'].empty?
    puts "No images found in the folder."
  else
    User.all.each_with_index do |user, index|
      user.photo.attach(io: URI.open("https://res.cloudinary.com/dnd9g94xw/image/upload/#{resources['resources'][index]['public_id']}"), filename: "#{resources['resources'][index]['public_id']}.jpg", content_type: "image/jpeg")
    end
end
puts "Finished attaching cat images to users!"

puts "Creating 20 very unique Offers!"
Offer.create!(plant_name: "Monstera", status: true, price: 7.89, plant_description: "Large, heart-shaped leaves with natural holes. Thrives in bright, indirect light.", user: User.all.sample)
Offer.create!(plant_name: "Aloe Vera", status: true, price: 4.50, plant_description: "Succulent plant known for its medicinal properties. Prefers dry, sandy soil.", user: User.all.sample)
Offer.create!(plant_name: "Fiddle Leaf Fig", status: true, price: 8.75, plant_description: "Tall plant with large, glossy leaves. Perfect for bright, airy spaces.", user: User.all.sample)
Offer.create!(plant_name: "Snake Plant", status: true, price: 5.99, plant_description: "Hardy, low-maintenance plant with tall, sword-like leaves. Ideal for beginners.", user: User.all.sample)
Offer.create!(plant_name: "Peace Lily", status: true, price: 6.45, plant_description: "Elegant plant with dark green leaves and white blooms. Loves shade and moisture.", user: User.all.sample)
Offer.create!(plant_name: "Spider Plant", status: true, price: 3.80, plant_description: "Fast-growing with arching green and white striped leaves. Easy to propagate.", user: User.all.sample)
Offer.create!(plant_name: "Boston Fern", status: true, price: 4.25, plant_description: "Lush, feathery fronds that thrive in humid, shaded environments.", user: User.all.sample)
Offer.create!(plant_name: "Pothos", status: true, price: 3.99, plant_description: "Trailing plant with heart-shaped leaves. Great for hanging baskets.", user: User.all.sample)
Offer.create!(plant_name: "Rubber Plant", status: true, price: 7.20, plant_description: "Thick, glossy leaves with a deep green hue. Prefers bright, indirect light.", user: User.all.sample)
Offer.create!(plant_name: "Jade Plant", status: true, price: 6.35, plant_description: "Succulent with thick, round leaves. Symbolizes prosperity and luck.", user: User.all.sample)
Offer.create!(plant_name: "Calathea", status: true, price: 5.50, plant_description: "Known for its striking leaf patterns and vibrant colors. Loves humidity.", user: User.all.sample)
Offer.create!(plant_name: "ZZ Plant", status: true, price: 7.10, plant_description: "Tough, drought-resistant plant with shiny, deep green leaves. Perfect for low light.", user: User.all.sample)
Offer.create!(plant_name: "English Ivy", status: true, price: 2.75, plant_description: "Climbing vine with small, lobed leaves. Ideal for creating green walls.", user: User.all.sample)
Offer.create!(plant_name: "Bird of Paradise", status: true, price: 9.99, plant_description: "Tropical plant with large, banana-like leaves. Produces striking orange flowers.", user: User.all.sample)
Offer.create!(plant_name: "Chinese Money Plant", status: true, price: 6.89, plant_description: "Compact plant with round, coin-shaped leaves. Easy to care for.", user: User.all.sample)
Offer.create!(plant_name: "Dracaena", status: true, price: 5.40, plant_description: "Tall, spiky leaves. Thrives in low light and needs minimal water.", user: User.all.sample)
Offer.create!(plant_name: "Bonsai Tree", status: true, price: 9.50, plant_description: "Miniature tree cultivated for its aesthetic appeal. Requires careful pruning.", user: User.all.sample)
Offer.create!(plant_name: "Philodendron", status: true, price: 3.60, plant_description: "Trailing plant with heart-shaped leaves. Adapts well to low light.", user: User.all.sample)
Offer.create!(plant_name: "Lavender", status: true, price: 4.99, plant_description: "Fragrant herb with purple flowers. Known for its calming scent.", user: User.all.sample)
Offer.create!(plant_name: "Orchid", status: true, price: 8.25, plant_description: "Exotic plant with delicate, long-lasting flowers. Requires specific care.", user: User.all.sample)
puts "Finished creating #{Offer.count} very, very unique offers!"

puts "Attaching actual real plant images to offers!"
Offer.all.each do |offer|
  puts "Attaching real plant image to #{offer.plant_name.gsub(" ", "")}"
  resources = Cloudinary::Api.resources(prefix: "#{offer.plant_name.gsub(" ", "")}", type: "upload", max_results: 1)
  puts resources['resources'][0]
  offer.photo.attach(io: URI.open("https://res.cloudinary.com/dnd9g94xw/image/upload/#{resources['resources'][0]['public_id']}"), filename: "#{offer.plant_name.gsub(" ", "")}.jpg", content_type: "image/jpeg")
end
puts "Finished attaching actual real plant images to offers!"

# puts "Creating 100 bookings!"
# 100.times do
#   Booking.create!(user: User.all.sample, offer: Offer.all.sample, status: booking_status.sample, comment:"This is a comment.", duration:"#{rand(60)} days.")
# end
# puts "Finished creating #{Booking.count} bookings!"

# puts "Attaching images to offers! (I hope)"
# Offer.all.each do |offer|
#   puts "Opening URL #{url}"
#   file = URI.open("https://loremflickr.com/#{img_width}/#{img_height}/#{offer.plant_name.gsub(" ", "")}")
#   puts "Attaching photo to offer..."
#   offer.photo.attach(io: file, filename: "#{offer.plant_name}.jpg", content_type: "image/jpg")
#   puts "Saving offer..."
#   offer.save
# end

# Use this bit to attach loremflickr selfies to users

# puts "Attaching images to users! (I hope)"
# User.all.each do |user|
#   puts "Opening URL #{url}"
#   file = URI.open("https://loremflickr.com/#{img_width}/#{img_height}/selfie")
#   puts "Attaching photo to user..."
#   user.photo.attach(io: file, filename: "#{user.username}.jpg", content_type: "image/jpg")
#   puts "Saving offer..."
#   user.save
# end
