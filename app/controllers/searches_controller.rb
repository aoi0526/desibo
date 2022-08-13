class SearchesController < ApplicationController

  def company_search
    prefecture = params[:prefecture_id]
    occupation = params[:occupation_genre_id]
    if occupation == ""
      @companies = Company.where(prefecture_id: prefecture).page(params[:page]).per(2)
    elsif prefecture == ""
      @companies = Company.where(occupation_genre_id: occupation).page(params[:page]).per(2)
    else
      @companies = Company.where(prefecture_id: prefecture).where(occupation_genre_id: occupation).page(params[:page]).per(2)
    end
  end

end
