class Movie < ApplicationRecord
  self.ignored_columns = %w[rating]
  has_many :bookmarks
  validates :title, :overview, presence: true, uniqueness: true
end
