class PurchasesController < ApplicationController
  def index
      @purchases = Purchase.all
  end

  def new
    # we need @restaurant in our `simple_form_for`
    @book = Book.find(params[:book_id])
    @purchase = Purchase.new
  end

  def create
    book = Book.find(params[:book_id])
    purchase  = Purchase.create!(book: book, amount: book.correct_price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: book.title,
      images: [book.photo],
      amount: book.correct_price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: purchase_url(purchase),
    cancel_url: purchase_url(purchase)
  )

  purchase.update(checkout_session_id: session.id)
  redirect_to new_purchase_payment_path(purchase)
    

    
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
  end
  

end
