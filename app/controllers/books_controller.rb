class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @books = Book.all

  end

  def show
    @bike = Book.find(params[:id])
  end

  def new
    @bike = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if
      @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def my_books
    @bikes = Book.where(user_id: current_user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :edition_year)
  end
end
