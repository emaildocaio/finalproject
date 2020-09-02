class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
  end

  def show
    authorize @product
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
    @product.destroy
    redirect_to myproducts_path
  end

  def my_index
    @products = Product.where(company: current_user.company)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :activity, :capacity, :status, :photo)
  end
end
