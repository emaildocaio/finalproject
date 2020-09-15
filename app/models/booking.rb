class Booking < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  validates :date, presence: true
  validates :participants, numericality: { greater_than_or_equal_to: 1 }
  has_many :guests, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :guests, reject_if: :all_blank, allow_destroy: true
  monetize :price_cents

  def self.to_csv
    headers = ["first name", "last name", "guests", "email", "phone", "document", "trip", "date", "price_cents", "status"] 
  #  attributes = ["date", "price_cents", "status"]
    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |booking|
        csv << [
          booking.shopping_cart.user.first_name,
          booking.shopping_cart.user.last_name,
          booking.guests.size,
          booking.shopping_cart.user.email,
          booking.shopping_cart.user.phone,
          booking.shopping_cart.user.document,
          booking.product.name,
          booking.date,
          booking.price_cents,
          booking.status
        ]
      end
    end
  end

  def status
    canceled ? "Canceled" : "Confirmed"
  end

end
