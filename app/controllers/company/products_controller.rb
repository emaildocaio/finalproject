class Company::ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @products = current_user.company.products
    @product = @products.first
    if params[:search].nil?
      @bookings = Booking.where(product: @product).order(date: :asc)
    else
      @product = @products.find(params[:search][:product])
      if params[:search][:date].present?
        @date = params[:search][:date]
        @bookings = Booking.where(product: @product, date: @date).order(date: :asc)
      else
        @bookings = Booking.where(product: @product).order(date: :asc)
      end
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Bookings",
                page_size: 'A4',
                template: "pdf/product.html.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
      end
    end
  end

  private

  def record_not_found
    redirect_to action: 'index'
  end
end
