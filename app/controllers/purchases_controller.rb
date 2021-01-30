class PurchasesController < ApplicationController
  def index
      @purchases = Purchase.all
  end

  def show
      @purchase = Purchase.find(params[:id])
  end

  def new
    # we need @restaurant in our `simple_form_for`
    @book = Book.find(params[:book_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @book = Book.find(params[:book_id])
    @purchase.book = @book
    @book.save
    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:purchase).permit(:payment_method, :purchase_date_time, :closing_date_time)
  end

end
