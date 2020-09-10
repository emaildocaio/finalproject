class Company::BookingsController < ApplicationController
  def index
    @bookings = Booking.where(product: current_user.company.products)
  end
end
