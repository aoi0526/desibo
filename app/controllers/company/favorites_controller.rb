class Company::FavoritesController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    favorite = current_user.favorites.new(company_id: @company.id)
    favorite.save
  end


  def destroy
    @company = Company.find(params[:company_id])
    favorite = current_user.favorites.find_by(company_id: @company.id)
    favorite.destroy
  end

  private

  def company_params
    @company = Company.find(params[:company_id])
  end
end
