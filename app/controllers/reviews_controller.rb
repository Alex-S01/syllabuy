class ReviewsController < ApplicationController

  def new
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new(review_params)

    @review.purchase = @review

    if @review.save
      redirect_to purchase_reviews_path
    
    else
      render :new

    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
