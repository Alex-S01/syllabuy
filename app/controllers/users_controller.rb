class UsersController < ApplicationController
  def show
    @user = current_user
    @purchases = Book.where(user_id: current_user.id)
    @books = Book.where(user_id: current_user.id)
  end
end
