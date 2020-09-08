class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    @review.product = @product
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @product = Product.find(params[:product_id])
    @review.product = @product
    authorize @review
    if @review.save
      redirect_to product_path(params[:product_id])
    else
      flash[:alert] = 'Something went wrong'
      render :new, product: @product
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
