class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @shopping_cart = ShoppingCart.select(current_user)
    @booking.shopping_cart = @shopping_cart
    @booking.product = Product.find(params[:product_id])
    @booking.save
    redirect_to product_path(params[:product_id], anchor: "footer")
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    if @booking.save
      redirect_to current_shopping_cart_path
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to current_shopping_cart_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :participants, guests_attributes: [:id, :name, :_destroy])
  end
end
