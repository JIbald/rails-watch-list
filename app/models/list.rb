class List < ApplicationRecord
  # db relations
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # cloudinary
  has_one_attached :photo

  # validations
  validates :name, uniqueness: true
  validates :name, length: { minimum: 1 }
end
