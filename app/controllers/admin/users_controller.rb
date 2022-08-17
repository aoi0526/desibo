class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :index, :edit, :update]
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :detail, :prefecture_id, :city, :user_image, :is_deleted)
  end
end
