class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_root, only: :edit

  def show
    @items = @user.items
    @card = user_pay_card
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

  def user_pay_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    customer.cards.first
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @user.id
  end
end
