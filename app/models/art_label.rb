class ArtLabel < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :image_url, presence: true
  validates :brewery, presence: true
end
