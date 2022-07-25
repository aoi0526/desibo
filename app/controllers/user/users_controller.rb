class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
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

  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    # セッション情報を全て削除
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :detail, :prefecture_id, :city, :user_image)
  end
end
