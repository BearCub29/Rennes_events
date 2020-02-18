# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#User.destroy_all

05.times do
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: rand(5..20)),
    email: Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password: Faker::Internet.password(min_length: 8) 
    )
end
05.times do
  Event.create!(
    start_date: Faker::Date.forward(days: 90), 
    duration: Faker::Name.last_name,
    title: Faker::Lorem.sentence(word_count: rand(5..20)),
    description: Faker::Internet.email(domain: 'yopmail.com'),
    price: Faker::Internet.password(min_length: 8), 
    location:
    user_id:
    )
end
puts "check"