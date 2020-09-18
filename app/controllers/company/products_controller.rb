class Company::ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @products = current_user.company.products
    return nil if @products.empty?

    @product = @products.first
    if params[:search].nil?
      @bookings = Booking.where(product: @product)
                        .includes([:guests, :shopping_cart])
                        .includes(shopping_cart: :user)
                        .order(date: :asc)
    else
      @product = @products.find(params[:search][:product])
      if params[:search][:date].present?
        @date = params[:search][:date]
        @bookings = Booking.where(product: @product, date: @date)
                          .includes([:guests, :shopping_cart])
                          .includes(shopping_cart: :user)
                          .order(date: :asc)
      else
        @bookings = Booking.where(product: @product)
                          .includes([:guests, :shopping_cart])
                          .includes(shopping_cart: :user)
                          .order(date: :asc)
      end
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Bookings",
                page_size: 'A4',
                template: "pdf/manifest.html.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
      end
    end

    @bookings_by_date = Booking.where(product_id: @product.id, date: @date)
    @participants_array = @bookings_by_date.map do |booking|
      booking.guests.size + 1
    end
    @participants_array.empty? ? @total_participants = 0 : @total_participants = @participants_array.reduce(:+)

  end

  private

  def record_not_found
    redirect_to action: 'index'
  end
end
