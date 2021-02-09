class Users::PurchasesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @purchases = user.purchases

    render 'purchases/index'
  end

  def show
    @user = User.find(params[:user_id])
    @purchase = Purchase.find(params[:id])
    render 'purchases/show'
  end

end
