class Company::BookingsController < ApplicationController
  def index
    if params[:search].nil?
      @bookings = Booking.where(product: current_user.company.products).order(date: :asc)
    else
      @dates = build_dates
      @bookings = Booking.where(product: current_user.company.products, date: @dates[0]..@dates[2]).order(date: :asc)
    end
  end

  private

  def build_dates
    # Build dates from form params
    return nil unless params[:search]
    dates = params[:search][:start_date].split(" ")
  end

  def dashboard
    @bookings = Booking.all
    authorize @bookings
  end
end
