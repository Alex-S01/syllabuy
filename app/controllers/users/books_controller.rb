class Users::BooksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @books = user.books.where(status: "false")

    render 'books/my_books'
  end
end
