class ProductsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: %i[index show]


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
