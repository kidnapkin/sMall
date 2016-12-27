# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

60.times do |n|
    Product.create!(name:                   Faker::Beer.name,
                    description:            Faker::Hipster.paragraphs,
                    price:                  Faker::Number.decimal(2),
                    image:                  Faker::Placeholdit.image)
end

15.times do |n|
    Category.create!(name: Faker::Beer.style)
end
