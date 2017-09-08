FactoryGirl.define do
  factory :review do
    feels Faker::Hacker.say_something_smart
    intoxication_level [['Not Intoxicated'],['Buzzed'],['More Buzzed'],['Drunk'],['More Drunk'],['Wasted']].sample
    joy Faker::Number.between(1, 5)
    fear Faker::Number.between(1, 5)
    sadness Faker::Number.between(1, 5)
    disgust Faker::Number.between(1, 5)
    anger Faker::Number.between(1, 5)
    cleverness Faker::Number.between(1, 5)
    collectability Faker::Number.between(1, 5)
    controversiality Faker::Number.between(1, 5)
    buyability Faker::Number.between(1, 5)
    art_label
    user
  end
end
