class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    authorize @shopping_cart
  end
end
