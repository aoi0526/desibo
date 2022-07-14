class User::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :detail, :prefecture_id, :city, :user_image)
  end
end
