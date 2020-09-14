class Company::ProductsController < ApplicationController
  def index
    if params[:search].nil?
      @bookings = Booking.where(product: current_user.company.products).order(date: :asc)
    else
     product = Product.find_by(name: params[:search][:product])
     @bookings = Booking.where(product: product).order(date: :asc)
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
end
