class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @product = Product.find(params[:product_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @shopping_cart = helpers.select_shopping_cart
    @booking.shopping_cart = @shopping_cart
    @booking.product = Product.find(params[:product_id])
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
