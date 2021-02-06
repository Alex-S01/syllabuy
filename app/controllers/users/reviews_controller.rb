class Users::ReviewsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @reviews = user.reviews

    render 'reviews/index'
  end
end
