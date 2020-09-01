class Booking < ApplicationRecord
  belongs_to :shopping_cart, dependent: :destroy
  belongs_to :product, dependent: :destroy
  validates :date, presence: true
end
