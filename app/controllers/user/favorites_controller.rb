class User::FavoritesController < ApplicationController

  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).pluck(:company_id)
    @favorite_companies = Company.find(@favorites)
    @favorites = Favorite.all
  end

end

