class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
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
    params.require(:book).permit(:title, :author, :summary, :topic, :language, :edition_year, :publisher, :pages, :ISBN, :delivery_method, :selling_address, :price, :created_at, :updated_at)
  end
end
