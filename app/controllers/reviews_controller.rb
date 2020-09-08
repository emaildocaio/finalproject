class ReviewsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create]

  def index
    @reviews = @product.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product
    authorize @review
    if @review.save
      flash[:alert] = 'Thanks for the review!'
      redirect_to product_path(params[:product_id], anchor: 'footer')
    else
      flash[:alert] = 'Something went wrong'
      @booking = Booking.new
      render 'products/show', booking: @booking
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
