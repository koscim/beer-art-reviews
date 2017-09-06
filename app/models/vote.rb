class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :vote_number, presence: true

  belongs_to :user
  belongs_to :review 
end
