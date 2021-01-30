# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning up database"
User.destroy_all
puts "database is clean"

20.times do
    user = User.create!(
        email: Faker::Internet.email,
        password: "123456",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        date_of_birth: Faker::Date.between(from: '1900-01-01' to: Date.today),
        email: Faker::Internet.email,
        gender: Faker::Gender.type,
        university: Faker::University.name,
        year_of_study: Faker::Number.between(from: 2010, to: 2021),
        phone_number: Faker::PhoneNumber.phone_number,
        about_me: Faker::Lorem.paragraph(sentence_count: 5)
    )

    puts "User #{user.id} is created"
end
