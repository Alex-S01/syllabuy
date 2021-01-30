class ReviewsController < ApplicationController

  def new
    @purchase = Purchase.find(params[:id])
    @review = Review.new
  end


end
