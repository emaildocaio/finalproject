class Company::BookingsController < ApplicationController
  
  def index
    
    if params[:search].nil?
      @bookings = Booking.where(product: current_user.company.products).order(date: :asc)
    else
      @dates = build_dates
      case @dates.size
      when 1
        @bookings = Booking.where(product: current_user.company.products, date: @dates[0]).order(date: :asc)
      else
        @bookings = Booking.where(product: current_user.company.products, date: @dates[0]..@dates[2]).order(date: :asc)
      end
    end

    respond_to do |format|
      format.html
      format.csv { send_data  @bookings.to_csv }
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking, policy_class: CompanyBookingPolicy
  end
  
  def edit
    @booking = Booking.find(params[:id])
    authorize @booking, policy_class: CompanyBookingPolicy
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking, policy_class: CompanyBookingPolicy
    @booking.canceled = true
    @booking.save
    redirect_to company_booking_path(@booking.id)
  end

  def reactivate
    @booking = Booking.find(params[:id])
    authorize @booking, policy_class: CompanyBookingPolicy
    @booking.canceled = false
    @booking.save
    redirect_to company_booking_path(@booking.id)
  end

  def dashboard
    @products = Product.where(company: current_user.company)
    @date = Date.today
    authorize @products
  end


  def bookings_chart
    @bookings = Booking.where(product: current_user.company.products)
    render json: @bookings.group_by_day(:date).count
    authorize @bookings
  end

  def products_chart  
    @bookings = Booking.where(product: current_user.company.products)
    render json: @bookings.joins(:product).group('products.name').count
    authorize @bookings
  end
  
  # def participants_chart
  #   @bookings = Booking.where(product: current_user.company.products)
  #   authorize @bookings
  #   @totalpart = {}
  #   @bookings.each do |booking|
  #     if totalpart.key?("#{booking.product.name} #{booking.date.strftime('%d/%m')}")
  #      totalpart["#{booking.product.name} #{booking.date.strftime('%d/%m')}"] += booking.guests.size + 1
  #      else
  #      totalpart["#{booking.product.name} #{booking.date.strftime('%d/%m')}"] = booking.guests.size + 1
  #      end
  #     end 
  #   render json: @totalpart
  # end

  def participants_chart
    @products = current_user.company.products
    @data = @products.map do |product|
      @totalpart = {}
      product.bookings.each do |booking|
        if @totalpart.key?("#{booking.product.name} #{booking.date.strftime('%d/%m')}")
          @totalpart["#{booking.date.strftime('%d/%m')}"] += booking.guests.size + 1
          else
          @totalpart[" #{booking.date.strftime('%d/%m')}"] = booking.guests.size + 1
          end
        end
      {name: product.name, data: @totalpart}
    end
    authorize Booking
    render json: @data
  end

  def financials_chart
    @bookings = Booking.where(product: current_user.company.products) #pego meus bookings q vai ser um array 
    @booking_hash = {}
    @bookings_price = @bookings.map do |booking|
      @price =  booking.price_cents/100 # this is the value of my hash
      @date = booking.date.strftime('%d/%m') #this is my key
      if @booking_hash.key?(@date)
        @booking_hash[@date] += @price
      else
       @booking_hash[@date] = @price
      end
    end
    authorize @bookings
    render json: @booking_hash    
  end
  
  private

  def build_dates
    # Build dates from form params
    return nil unless params[:search]
    dates = params[:search][:start_date].split(" ")
  end

end
