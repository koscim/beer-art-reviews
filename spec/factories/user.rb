FactoryGirl.define do
  factory :user do
    profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'beers', 'logos', 'mdqdt.jpg' ))}
    sequence(:first_name) { |n| "Joe#{n}" }
    sequence(:last_name) { |n| "Schmoe#{n}" }
    sequence(:username) { |n| "joeschmoe#{n}" }
    sequence(:email) { |n| "joeschmoe#{n}@gmail.com" }
    password "password"
  end
end
