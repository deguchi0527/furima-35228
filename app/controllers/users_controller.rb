class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :updata]

  def show
    @items = @user.items
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
