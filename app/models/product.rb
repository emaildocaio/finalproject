class Product < ApplicationRecord
  belongs_to :company
  has_many :bookings, dependent: :destroy
  has_many :shopping_carts, through: :bookings
  validates :name, :capacity, :price, :activity, :description, presence: true
  validates :activity, inclusion: { in: ["Day Trip", "Dive"]}
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :capacity, numericality: { greater_than: 0}
  has_one_attached :photo

  def is_from_company?(user)
    return false if user.nil?
    company == user.company
  end

  def is_in_shopping_cart?(user)
    return false if user.nil?
    shopping_cart = user.shopping_carts.find_by(status: 'pendente')

    if shopping_cart
      Booking.find_by(shopping_cart: shopping_cart, product: self).present?
    else
      false
    end
  end
end
