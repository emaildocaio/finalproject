class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @product = Product.find(params[:product_id])
  end

  def create
    params[:booking][:count].to_i
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
    params.require(:booking).permit(:date, :count)
  end
end
