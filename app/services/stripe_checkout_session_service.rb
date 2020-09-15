class StripeCheckoutSessionService
  def call(event)
    shopping_cart = ShoppingCart.find_by(checkout_session_id: event.data.object.id)
    shopping_cart.update!(status: "pago")
      if @shopping_cart.update
      ShoppingCartMailer.with(shopping_cart: @shopping_cart).payment_confirmation.deliver_now
    end
  end
end
