FactoryGirl.define do
  factory :user do
    first_name "Joe"
    last_name "Schmoe"
    username "joeschmoe"
    sequence(:email) { |n| "joeschmoe@gmail.com#{n}"}
    password "password"
    
  end
end
