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
    params.require(:user).permit(:name, :introduction )
  end
end
