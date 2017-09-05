# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtLabel.all.destroy_all
Review.all.destroy_all

15.times do
  ArtLabel.create(
    name: Faker::Beer.name,
    image_url: Faker::Company.logo,
    brewery: Faker::Lovecraft.deity,
    beer_style: Faker::Beer.style
  )
end

30.times do
  Review.create(
    feels: Faker::Lovecraft.sentences(2),
    art_label: Faker::Number.between(1, 15),
    user_id: Faker::Number.between(1, 30),
  )
end
