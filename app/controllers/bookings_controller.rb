class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # @booking.user = current_user
    authorize @booking
    @shopping_cart = ShoppingCart.select(current_user)
    @booking.shopping_cart = @shopping_cart
    @booking.product = Product.find(params[:product_id])
    @product = @booking.product
    @review = Review.new
    @bookings_by_date = Booking.where(product_id: @booking.product, date: @booking.date)
    @participants_array = @bookings_by_date.map do |booking|
      booking.guests.size + 1
    end
    @participants_array.empty? ? @total_participants = 0 : @total_participants = @participants_array.reduce(:+)
    if (@booking.guests.size + 1 + @total_participants) > @booking.product.capacity
      flash[:alert] = "You are trying to book more participants than the capacity left: #{@booking.product.capacity - @total_participants}"
      render "products/show"
    else
      @booking.price = (@booking.guests.size + 1) * @booking.product.price
      @booking.save
      notify_booking(@booking) # Send a notification after creating a booking
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
    @booking.price = (@booking.guests.size + 1) * @booking.price
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
    params.require(:booking).permit(:date, :participants, :canceled?, guests_attributes: [:id, :name, :_destroy])
  end

  def notify_booking(booking)
    user = booking.notification.user
    unread_count = user.unread_notifications_count # Count unread notifications
    htmls = []
    htmls << render_to_string(partial: 'layouts/notification_badge', locals: { count: unread_count })
    htmls << render_to_string(partial: 'notifications/notifications_link', locals: { count: unread_count })
    BookingNotificationChannel.broadcast_to(
      user, # Send the notification to the owner of the product
      html: htmls # Send the partials for dynamic HTML generation
    )
  end
end
