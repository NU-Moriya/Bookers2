class RootController < ApplicationController
  def top
    @user = User.find(params[:id])
    redirect_to user_path()
  end
  
  def about
  end 
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
end