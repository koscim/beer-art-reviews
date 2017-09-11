FactoryGirl.define do
  factory :art_label do
    name Faker::Beer.name
    label_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'beers', 'logos', 'mdqdt.jpg' ))}
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
