class PaymentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new]

  def new
    @shopping_cart = current_user.shopping_carts.where(status:"pendente").find(params[:shopping_cart_id])
  end
end
