class User::FavoritesController < ApplicationController

  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).pluck(:company_id)
    @favorite_companies = Company.find(@favorites)
    #@favorite_company = Kaminari.paginate_array(@favorite_company).page(params[:page]).per(6)
    @favorites = Favorite.all
  end

end

