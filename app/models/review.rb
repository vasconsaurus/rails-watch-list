class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true
  validates :score, presence: true, numericality: {
                                      greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 5
                                    }
end
