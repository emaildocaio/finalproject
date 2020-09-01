class Booking < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  validates :date, presence: true
end
