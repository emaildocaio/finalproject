class Company::FinancialsController < ApplicationController
  def index
    if params[:search].nil?
      @bookings = Booking.where(product: current_user.company.products)
                        .includes([:shopping_cart, :product])
                        .includes(shopping_cart: :user)
                        .order(date: :asc)
    else
      @dates = build_dates
      case @dates.size
      when 1
        @bookings = Booking.where(product: current_user.company.products, date: @dates[0])
                          .includes([:shopping_cart, :product])
                          .includes(shopping_cart: :user)
                          .order(date: :asc)
      else
        @bookings = Booking.where(product: current_user.company.products, date: @dates[0]..@dates[2])
                          .includes([:shopping_cart, :product])
                          .includes(shopping_cart: :user)
                          .order(date: :asc)
      end
    end

    ### This line is overwriting the queries above and returning ALL bookings
    # @bookings = Booking.all.paginate(:page => params[:page], :per_page => 3)
  end

  def dashboard
    @bookings = Booking.all
    authorize @bookings
  end

  private

  def build_dates
    # Build dates from form params
    return nil unless params[:search]
    dates = params[:search][:start_date].split(" ")
  end

end
