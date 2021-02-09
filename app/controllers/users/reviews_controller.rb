class Users::ReviewsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @reviews = user.reviews

    render 'reviews/index'
  end

   def new
    @user = User.find(params[:user_id])
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new
    render 'reviews/new'
  end

  def create
    @user = User.find(params[:user_id])
    @purchase = Purchase.find(params[:purchase_id])
    @review = Review.new(review_params)
    @review.purchase = @purchase
    @review.user = @user

    if @review.save
      redirect_to user_reviews_path(current_user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
