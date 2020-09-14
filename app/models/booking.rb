class Booking < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  validates :date, presence: true
  validates :participants, numericality: { greater_than_or_equal_to: 1 }
  has_many :guests, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :guests, reject_if: :all_blank, allow_destroy: true

  def participants
    self.guests.size + 1
  end
end
