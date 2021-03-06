class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      sql_query = "\
      title @@ :query \
      OR author @@ :query \
      OR publisher @@ :query \
      OR topic @@ :query \
      "
      @books = Book.where(sql_query, query:  "%#{params[:query]}%")
      @markers = @books.geocoded.map do |book|
        {
          lat: book.latitude,
          lng: book.longitude,
          infoWindow: { content: render_to_string(partial: "/books/map_info_window", locals: { book: book }) }
        }
        end
      else
        @books = Book.all
        @markers = @books.geocoded.map do |book|
          {
            lat: book.latitude,
            lng: book.longitude,
            infoWindow: { content: render_to_string(partial: "/books/map_info_window", locals: { book: book }) }
          }
        end
      end
    end

    def show
      @book = Book.find(params[:id])
      @markers = [{ lat: @book.latitude, lng: @book.longitude }]
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      @book.user = current_user

      if @book.save
        redirect_to book_path(@book), notice: 'Book was successfully created.'

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

        redirect_to book_path(@book), notice: 'Book was successfully updated.'


      else

        render :edit
      end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy

      redirect_to books_path, notice: 'Book was successfully destroyed.'

    end


 # def mybooks (afficher nos bouquins que nous avons créés) -> A ameliorer !
 #  @books = user.records scope.where (user: user)

 # end

 private

 def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:title, :author, :summary, :topic, :subtopic, :language, :edition_year, :publisher, :pages, :ISBN, :condition, :delivery_method, :selling_address, :price, :correct_price, :created_at, :updated_at, :photo)
end

end
