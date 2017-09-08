FactoryGirl.define do
  factory :art_label do
    name Faker::Beer.name
    image_url Faker::Company.logo
    brewery Faker::Lovecraft.deity
    beer_style Faker::Beer.style
    art_style "Art Deco"
    container_type "Can"
    beer_description Faker::Hacker.say_something_smart
    art_description Faker::Hacker.say_something_smart
    beer_rating 5
    user

  end
end
