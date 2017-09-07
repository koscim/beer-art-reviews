class Review < ApplicationRecord
  belongs_to :art_label
  belongs_to :user
  has_many :votes
  has_many :users, through: :votes

  validates :feels, presence: true
  validates :art_label_id, presence: true
  validates :user_id, presence: true
end
