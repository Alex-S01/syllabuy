# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning up database"
Review.destroy_all
Purchase.destroy_all
Book.destroy_all
User.destroy_all
puts "database is clean"

20.times do
    user = User.create!(
        email: Faker::Internet.email,
        password: "123456",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        date_of_birth: Faker::Date.between(from: 25.year.ago, to: Date.today),
        email: Faker::Internet.email,
        gender: Faker::Gender.type,
        university: Faker::University.name,
        year_of_study: Faker::Number.between(from: 2010, to: 2021),
        phone_number: Faker::PhoneNumber.phone_number,
        about_me: Faker::Lorem.paragraph(sentence_count: 5)

    )

    puts "User #{user.id} is created"

    addresses = [
  'Kantersteen 12, 1000 Brussel',
  'Tweedekkerstraat 126, 1130 Brussel',
  'Sint-Lambertusstraat 200, 1200 Sint-Lambrechts-Woluwe',
  'Boondaalsesteenweg 418, 1050 Elsene',
  'Rogierlaan 51, 1030 Schaarbeek',
  'Jean Joseph Crocqlaan 15, 1020 Brussel',
  'Rue Marie Depage 1, 1180 Uccle',
  'Wayezstraat 160-162, 1070 Anderlecht',
  'Ter Platen 12, 9000 Gent',
  'Gebroeders de Smetstraat 6, 9000 Gent'
]

  3.times do |i|
      book = Book.create!(
        # user: User.find(rand(1..10)),
          user: user,
          title: Faker::Book.title,
          author: Faker::Book.author,
          summary: Faker::Lorem.paragraph(sentence_count: 10),
          pages: Faker::Number.between(from: 150, to: 500),
          price: Faker::Number.between(from: 10, to: 500),
          ISBN: Faker::Code.isbn(base: 13),
          edition_year: Faker::Number.between(from: 1950, to: 2021),
          language: %w[English French Dutch].sample,
          publisher: Faker::Book.publisher,
          status: Faker::Boolean.boolean,
          delivery_method: %w[F2F Post].sample,
          selling_address: addresses[i],
          topic: %w[Architecture Business Economics Art Computer Education Biology Design History].sample,
          subtopic: Faker::Lorem.word
      )
      puts "Book #{book.id} is created"
  end

end




5.times do |i|
    purchase = Purchase.create!(
      # user: User.find(rand(1..10)),
        user: User.find(rand((User.first.id)..(User.last.id))),
        book: Book.find(rand((Book.first.id)..(Book.last.id))),
        payment_method: %w[Visa MasterCard BanContact PayPal].sample
    )
    puts "Purchase #{purchase.id} is created"
end

3.times do |i|
    review = Review.create!(
      # user: User.find(rand(1..10)),
        purchase: Purchase.find(rand((Purchase.first.id)..(Purchase.last.id))),
        rating: Faker::Number.between(from: 0, to: 5),
        content: Faker::Lorem.paragraph(sentence_count: 3)
    )
    puts "Review #{review.id} is created"
end
