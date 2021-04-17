class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @items = @user.items
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_cofirmation)
  end
end
