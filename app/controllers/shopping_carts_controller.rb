class ShoppingCartsController < ApplicationController
  before_action :select_shopping_cart, only: %i[show pay]

  def index
    @shopping_cart = ShoppingCart.select(current_user)
    authorize @shopping_cart
  end

  def show
    authorize @shopping_cart
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
