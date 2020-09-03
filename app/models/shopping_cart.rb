class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :products, through: :bookings

  validates :status, :user_id, presence: true
  # validates :voucher, uniqueness: true
  validates :status, inclusion: { in: %w(pendente cancelado pago),
    message: "%{value} não é um status válido!" }
end
