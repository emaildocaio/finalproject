class StripeCheckoutSessionService
  def call(event)
    shopping_cart = ShoppingCart.find_by(checkout_session_id: event.data.object.id)
    shopping_cart.update!(status: "pago", voucher: voucher_generator)
          if @shopping_cart.update
      ShoppingCartMailer.with(shopping_cart: @shopping_cart).payment_confirmation.deliver_now
    end
  end

  private

  def voucher_generator
    voucher_array = []
    letters = ('a'..'z').to_a
    6.times{voucher_array << letters.sample(1)}
    @voucher = voucher_array.join("")
    @voucher
  end
end
