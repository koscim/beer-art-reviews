class User < ApplicationRecord
  has_many :votes
  has_many :reviews
  has_many :art_labels

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :role, presence: true
  validates :email,
    format: { with: /\A.+@.+\..+\z/i }
  validates :encrypted_password,
    length: { minimum: 6 }
  validates :sign_in_count, presence: true,
    numericality: { greater_than_or_equal_to: 0, only_integer: true }
  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end
end
