class StripeCheckoutSessionService
  def call(event)
    shopping_cart = ShoppingCart.find_by(checkout_session_id: event.data.object.id)
    shopping_cart.update(state: 'pago')
  end
end
