class ArtLabel < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :label_photo, presence: true
  validates :brewery, presence: true
  mount_uploader :label_photo, LabelPhotoUploader

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
