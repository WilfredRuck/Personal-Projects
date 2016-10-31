# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(
	{name: "Paperclip", description: "A metal band that keeps your documents together", price: 5},
)

Product.create!(
	{name: "car", description: "Automobile that gets you around the city", price: 5000}
)

Product.create!(
	{name: "Moto 360 Watch", description: "An automated watch that pairs with your android phone", price: 320}
)

Product.create!(
	{name: "Ipad", description: "An Apple product that serves as a iphone companion with a huge screen", price: 450}
)