class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :products, through: :bookings

  validates :status, :user_id, presence: true
  # validates :voucher, uniqueness: true # => Don't uncomment till voucher generator or will break
  validates :status, inclusion: { in: %w(pendente cancelado pago),
    message: "%{value} não é um status válido!" }

  def self.select(current_user)
    if current_user.shopping_carts.where(status: 'pendente').empty?
      shopping_cart = ShoppingCart.new(status: 'pendente')
      shopping_cart.user = current_user
      shopping_cart.save!
    else
      shopping_cart = current_user.shopping_carts.where(status: 'pendente').last
    end
    shopping_cart
  end

  def calc_total_price
    sum = 0
    bookings.each do |booking|
      sum += booking.product.price * booking.participants
    end
    sum
  end
end
