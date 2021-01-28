class ReviewsController < ApplicationController
  def new
    @user = Purchase.find(params[:purchase_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @purchase = Purchase.find(params[:purchase_id])
    @review.purchase = @purchase
    @review.save
    redirect_to purchase_path(@purchase)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :creation_date)
  end

end
