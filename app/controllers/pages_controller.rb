class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
        sql_query = "\
        title @@ :query \
        OR author @@ :query \
        OR publisher @@ :query \
        "
        @books = Book.where(sql_query, query:  "%#{params[:query]}%")
      else
        @books = Book.limit(4)
      end
  end
end
