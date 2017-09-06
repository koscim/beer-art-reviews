class User < ApplicationRecord
  validates :name, presence: true

  has_many :votes
  has_many :reviews
  has_many :art_labels
end
