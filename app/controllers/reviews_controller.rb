class ReviewsController < ApplicationController

  def new
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new(review_params)
    @review.purchase = @purchase

    if @review.save
      redirect_to user_my_reviews_path(current_user)

    else
      render :new

    end
  end

  def show
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.find(params[:id])
  end

  def index
    @purchase = Purchase.find(params[:purchase_id])
    @reviews.purchase = @purchase
    @reviews = Purchase.where(purchase_id: purchase.id)
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
