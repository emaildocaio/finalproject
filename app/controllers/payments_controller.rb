class PaymentsController < ApplicationController
  def new
    @shopping_cart = current_user.shopping_carts.where(status:"pendente").find(params[:shopping_cart_id])
  end
end
