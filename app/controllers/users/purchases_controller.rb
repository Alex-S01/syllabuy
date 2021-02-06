class Users::PurchasesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @purchases = user.purchases

    render 'purchases/index'
  end
end
