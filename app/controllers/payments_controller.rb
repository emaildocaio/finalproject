class PaymentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new]

  def new
    @shopping_cart = ShoppingCart.select(current_user)
  end
end
