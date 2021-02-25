class Users::BooksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @books_pending = user.books.where(status: "false")
    @books_sold = user.books.where(status: "true")

    render 'books/my_books'
  end
end
