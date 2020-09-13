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
  product = Product.find(params[:product_id])
  shopping_cart = Order.create!(product: product, product_name: product.name, amount: product.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: product.name,
      images: [product.photo_url],
      amount: product.price_cents,
      currency: 'brl',
      quantity: 1
    }],
    success_url: shopping_cart_url(shopping_cart),
    cancel_url: shopping_cart_url(shopping_cart)
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
