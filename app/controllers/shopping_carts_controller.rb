class ShoppingCartsController < ApplicationController
  def index
    @shopping_cart = ShoppingCart.select(current_user)
    authorize @shopping_cart
  end

  def pay
    @shopping_cart = ShoppingCart.find(params[:id])
    authorize @shopping_cart
    @shopping_cart.total_price = @shopping_cart.calc_total_price
    @shopping_cart.status = 'pago'
    @shopping_cart.save
    redirect_to root_path # For Frontend: display a nice payment confirmation
  end
end
