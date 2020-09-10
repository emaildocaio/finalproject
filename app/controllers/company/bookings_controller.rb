class Company::BookingsController < ApplicationController
  def index
    dates = build_dates
    if dates.nil?
      @bookings = Booking.where(product: current_user.company.products).order(date: :asc)
    else
      @bookings = Booking.where(product: current_user.company.products, date: dates[0]..dates[1]).order(date: :asc)
    end
  end

  private

  def build_dates
    # Build dates from form params
    return nil unless params[:search]
    dates = []
    search = params[:search]
    dates << Date.new(search["start_date(1i)"].to_i, search["start_date(2i)"].to_i, search["start_date(3i)"].to_i)
    dates << Date.new(search["end_date(1i)"].to_i, search["end_date(2i)"].to_i, search["end_date(3i)"].to_i)
  end
end
