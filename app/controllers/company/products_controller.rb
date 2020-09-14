class Company::ProductsController < ApplicationController
  def index
    @products = current_user.company.products
    if params[:search].nil?
      @bookings = Booking.where(product: @products).order(date: :asc)
    else
      product = Product.find(params[:search][:product])
      @bookings = Booking.where(product: product).order(date: :asc)
    end
  end
end
