class Booking < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  validates :date, presence: true
  validates :participants, numericality: { greater_than_or_equal_to: 1 }
end
