# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


05.times do
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: rand(5..20)),
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password: "123456",
    password_confirmation: "123456"
    )
end
05.times do
  Event.create!(
    start_date: Faker::Date.forward(days: 90), 
    duration: Faker::Number.within(range: 1..10),
    title: Faker::Hipster.sentence(word_count: 5),
    description: Faker::Hipster.paragraph(sentence_count: 5),
    price: Faker::Number.within(range: 2..999), 
    location:Faker::Address.city,
    user_id: User.all.sample.id
    )
end
puts "check"