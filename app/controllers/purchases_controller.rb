class PurchasesController < ApplicationController
  def index
      @purchases = Purchase.all
  end

  def show
      @user = current_user
      @purchase = Purchase.find(params[:id])
  end

  def new
    # we need @restaurant in our `simple_form_for`
    @book = Book.find(params[:book_id])
    @purchase = Purchase.new

    authorize @purchase
  end

  def create
    @purchase = Purchase.new(purchase_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @book = Book.find(params[:book_id])

    @user = current_user
    @purchase.book = @book
    @purchase.user = current_user
    if @purchase.save
      redirect_to user_purchases_path(current_user)
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:payment_method, :purchase_date_time, :closing_date_time)
  end

end
