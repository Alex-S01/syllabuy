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

end





end
