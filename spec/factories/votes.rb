FactoryGirl.define do
  factory :vote do
    user
    review
    vote_number [-1, 1].sample
  end
end
