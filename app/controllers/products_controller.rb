class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.where(status: true).includes([:company, :reviews]).paginate(:page => params[:page], :per_page => 10)
    @companies = Company.all
    @markers = company_markers

    if params[:search].present?
      if params[:search][:name].empty?
        @products = Product.where(status: true)
      elsif params[:search].present?
        @products = @products.search_by_name_and_activity(params[:search][:name])
      elsif params[:activity].present?
        @products = @products.where(activity: params[:activity])
      end
    end

  end

  def day_trip
    skip_authorization
    @products = Product.where(status: true, activity: "Day Trip").paginate(:page => params[:page], :per_page => 5)
    @companies = Company.all
    @markers = company_markers
    render :index
  end

    def dive
    skip_authorization
    @products = Product.where(status: true, activity: "Dive").paginate(:page => params[:page], :per_page => 5)
    @companies = Company.all
    @markers = company_markers
    render :index
  end

  def show
    authorize @product
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.company = current_user.company
    authorize @product
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)

    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    authorize @product
    @company = @product.company
    @product.destroy
    redirect_to company_path(@company.id)
  end

  def my_index
    @products = Product.where(company: current_user.company)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :activity, :capacity, :status, :photo, :description)
  end

  def company_markers
    @companies.geocoded.map do |company|
      {
        lat: company.latitude,
        lng: company.longitude,
        name: company.name,
        infoWindow: render_to_string(partial: "info_window", locals: { company: company })
      }
    end

  end
end
