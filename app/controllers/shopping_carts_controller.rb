class ShoppingCartsController < ApplicationController
  before_action :select_shopping_cart, only: %i[show pay]

  def index
    @pay_shopping_carts = policy_scope(ShoppingCart).where(status: 'pago')
    @cancel_shopping_carts = policy_scope(ShoppingCart).where(status: 'cancelado')
  end

  def show
    authorize @shopping_cart

  end

  def create

    @shopping_cart = ShoppingCart.select(current_user)
    @booking = @shopping_cart.bookings.last
    authorize @shopping_cart

    line_items = []

    @shopping_cart.bookings.each do |booking|
      hash = { name: booking.product.name,
      amount: booking.price_cents,
      currency: 'brl',
      quantity: 1
      }

      line_items << hash

    end

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: line_items,
    success_url: shopping_carts_url,
    cancel_url: current_shopping_cart_url
  )
  @shopping_cart.update(checkout_session_id: session.id)
  redirect_to new_shopping_cart_payment_path(@shopping_cart)

  end


  private

  def select_shopping_cart
    @shopping_cart = ShoppingCart.select(current_user)
  end
end
