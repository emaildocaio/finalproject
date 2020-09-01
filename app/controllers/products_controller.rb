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
  end

  def create
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
    @product.destroy
    redirect_to myproducts_path
  end

  def my_index
    @products = Product.where(company: current_user.company)#.order(price: :asc)
    authorize @products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :activity, :capacity, :status)
  end
end
