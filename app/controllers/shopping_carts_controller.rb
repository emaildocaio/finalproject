class ShoppingCartsController < ApplicationController
  def index
    @shopping_cart = helpers.select_shopping_cart
    authorize @shopping_cart
  end

  def pay
    @shopping_cart = ShoppingCart.find(params[:id])
    authorize @shopping_cart
    @shopping_cart.total_price = helpers.total_price(@shopping_cart)
    @shopping_cart.status = 'pago'
    @shopping_cart.save
    redirect_to root_path # For Frontend: display a nice payment confirmation
  end
end
