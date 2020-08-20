class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.new
  end

  def show
    @users = User.find(params[:id])
    
    @usersbooks = @users.books
    
    @book = Book.new
    @books = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "You have updated user successfully"
    else
    flash[:alert] = "error"
    render action: :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
end
