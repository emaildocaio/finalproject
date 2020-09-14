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

  shopping_cart = ShoppingCart.select(current_user)
  booking = shopping_cart.bookings.last

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    # line_items: [{
    #   name: booking.product.name,
    #   images: [booking.product.photo.key],
    #   amount: booking.price_cents,
    #   currency: 'brl',
    #   quantity: 1
    # }],
    success_url: shopping_carts_path(current_user),
    cancel_url: shopping_carts_path(current_user)
  )


  shopping_cart.update(checkout_session_id: session.id)
  redirect_to new_shopping_cart_payment_path(shopping_cart)
end

  def pay
    authorize @shopping_cart
    @shopping_cart.total_price = @shopping_cart.calc_total_price
    @shopping_cart.status = 'pago'
    @shopping_cart.save
    redirect_to root_path # For Frontend: display a nice payment confirmation
  end

  private

  def select_shopping_cart
    @shopping_cart = ShoppingCart.select(current_user)
  end
end
