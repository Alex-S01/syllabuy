class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
      if params[:query].present?
        sql_query = "\
        title @@ :query \
        OR author @@ :query \
        OR publisher @@ :query \
        "
        @books = Book.where(sql_query, query:  "%#{params[:query]}%")
        @markers = @books.geocoded.map do |book|
          {
            lat: book.latitude,
            lng: book.longitude,
            # infoWindow: render_to_string(partial: "info_window", locals: { book: book })
          }
        end
      else
        @books = Book.all
        @markers = @books.geocoded.map do |book|
          {
            lat: book.latitude,
            lng: book.longitude,
            # infoWindow: render_to_string(partial: "info_window", locals: { book: book })
          }
      end
    end
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

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)

      redirect_to books_path

    else

      render :edit
    end
  end

 def destroy
      @book = Book.find(params[:id])
      @book.destroy

      redirect_to my_books_user_path
 end

  def my_books
    @books = Book.where(user_id: current_user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :topic, :subtopic, :language, :edition_year, :publisher, :pages, :ISBN, :delivery_method, :selling_address, :price, :created_at, :updated_at, :photo)
  end

end
