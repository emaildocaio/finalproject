class Company::ProductsController < ApplicationController
  def index
    @products = current_user.company.products
    @product = @products.first
    if params[:search].nil?
      @bookings = Booking.where(product: @product).order(date: :asc)
    else
      @product = Product.find(params[:search][:product])
      if params[:search][:date].present?
        @bookings = Booking.where(product: @product, date: params[:search][:date]).order(date: :asc)
      else
        @bookings = Booking.where(product: @product).order(date: :asc)
      end
    end
  end
end
