class Review < ApplicationRecord
  belongs_to :art_label

  validates :feels, presence: true
  validates :art_label_id, presence: true
  validates :user_id, presence: true
end
