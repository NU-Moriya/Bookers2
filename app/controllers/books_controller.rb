class BooksController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @allbooks = Book.all
    @book = Book.new
    @books = Book.new
    @user = current_user
  end
  
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully"
    else
     
     # @book = Book.new
     # この記述があるとエラー文が出てこなくなる。
     @allbooks = Book.all
      @user = current_user
      @books = Book.new
      #binding.pry
      flash[:alert] = "error"
      render("books/index")
    end
  end
  
  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @users = @book.user
    @usersbooks = @users.books
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit" 
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book)
    flash[:notice] = "You have updated successfully"
    else
    flash[:alert] = "error" 
    render action: :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "You have deleted successfully"
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body )
  end
  
end
