module ShoppingCartsHelper
  def total_price(shopping_cart)
    sum = 0
    shopping_cart.bookings.each do |booking|
      sum += booking.product.price
    end
    sum
  end
end
