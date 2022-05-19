class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, :overview, length: { minimum: 1 }

  private

  def check_for_bookmarks
    bookmarks.count.positive? ? false : true
  end
end
