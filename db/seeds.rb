# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "chinese" }
pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian" }
le_franz = { name: "Franz la roulotte", address: "7 le wagon, la petite roulotte", category: "french" }
pizza_morgan =  { name: "Pizza Murgan", address: "avnue de la Migros TakeAway", category: "italian" }
la_binouze =  { name: "La ptit mousse", address: "avnue de la soif", category: "belgian" }

[ dishoom, pizza_east, le_franz, pizza_morgan, la_binouze ].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
