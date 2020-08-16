class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
    @book = Book.new
    @books = @users.books
  end

  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :body )
  end
end
