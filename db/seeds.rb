# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtLabel.all.destroy_all
Review.all.destroy_all

5.times do
  username = Faker::Internet.unique.user_name
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: username,
    email: "#{username}@gmail.com",
    password: 'password',
    role: "member"
  )
end

User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: Faker::Space.moon,
  email: Faker::Internet.unique.email,
  password: 'password',
  role: "admin"
)

15.times do
  art_label = ArtLabel.create!(
    name: Faker::Beer.name,
    image_url: Faker::Company.logo,
    brewery: Faker::Lovecraft.deity,
    beer_style: Faker::Beer.style,
    user: User.find(1 + rand(6))
  )
  4.times do
    Review.create!(
      feels: Faker::MostInterestingManInTheWorld.quote,
      joy: (1 + rand(5)),
      fear: (1 + rand(5)),
      anger: (1 + rand(5)),
      intoxication_level: [['Not Intoxicated'],['Buzzed'],['More Buzzed'],['Drunk'],['More Drunk'],['Wasted']].sample,
      user: User.find(1 + rand(6)),
      art_label: art_label
    )
  end
end

# first_label = ArtLabel.first.id
# last_label = ArtLabel.last.id
#
# 30.times do
#   Review.create(
#     feels: Faker::Lovecraft.sentence,
#     art_label_id: Faker::Number.between(first_label, last_label),
#     user_id: Faker::Number.between(1, 30)
#   )
# end
