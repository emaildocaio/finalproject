class Company::ProductsController < ApplicationController
  def index
    if params[:search].nil?
      @bookings = Booking.where(product: current_user.company.products).order(date: :asc)
    else
     product = Product.find_by(name: params[:search][:product])
     @bookings = Booking.where(product: product).order(date: :asc)
    end
  end


end
