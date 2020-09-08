class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
