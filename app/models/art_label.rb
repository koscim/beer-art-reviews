class ArtLabel < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :image_url, presence: true
  validates :brewery, presence: true
end
