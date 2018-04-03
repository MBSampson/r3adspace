# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create! :first_name => 'Matthew', :last_name => 'Sampson', :email => 'mbsampson89@gmail.com', :password => 'test123', :password_confirmation => 'test123'
user = User.create! :first_name => 'Jennifer', :last_name => 'Hayden', :email => 'jHay@test.com', :password => 'test123', :password_confirmation => 'test123'

puts "Generated User"

Category.create!([
  { name: "appliances" },
  { name: "books" },
  { name: "phones" },
  { name: "electronics" },
  { name: "furniture" },
  { name: "general" },
  { name: "materials" },
  { name: "pets" },
  { name: "software" },
  { name: "music" },
  { name: "food" },
  { name: "services" }])

puts "Generated Category 12 seeds"

60.times do
  Ad.create!(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph + Faker::Lorem.paragraph + Faker::Lorem.paragraph,
    price: Faker::Number.decimal(2),
    category_id: Faker::Number.between(1, 12),
    user_id: Faker::Number.between(1, 2),
    published: "published",
    quantity: Faker::Number.between(1, 10),
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip
  )
end

puts "Generated Ad seed using Faker"
