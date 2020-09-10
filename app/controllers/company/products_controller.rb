class Company::ProductsController < ApplicationController
  def index
    @products = current_user.company.products
  end

  def show
    @product = current_user.company.products.find(params[:id])
    authorize @product
        @bookings = Booking.where(product: current_user.company.products)

  end
end
