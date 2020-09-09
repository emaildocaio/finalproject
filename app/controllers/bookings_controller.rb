class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @shopping_cart = ShoppingCart.select(current_user)
    @booking.shopping_cart = @shopping_cart
    @booking.product = Product.find(params[:product_id])
    @bookings_by_date = Booking.where(product_id: @booking.product, date: @booking.date)
    @participants_array = @bookings_by_date.map do |booking|
      booking.guests + 1
    end
    @participants_array.empty? ? @total_participants = 0 : @total_participants = @participants_array.reduce(:+) 
    if (@booking.guests + 1 + @total_participants) > @booking.product.capacity
      redirect_to root_path
    else
      @booking.save
      redirect_to product_path(params[:product_id], anchor: "footer")
    end
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
