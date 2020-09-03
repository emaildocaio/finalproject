class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @product = Product.find(params[:product_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @shopping_cart = ShoppingCart.select(current_user)
    @booking.shopping_cart = @shopping_cart
    @booking.product = Product.find(params[:product_id])
    if @booking.save
      redirect_to current_shopping_cart_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
