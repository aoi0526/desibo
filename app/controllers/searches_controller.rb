class SearchesController < ApplicationController

  def prefecture_search
    method = params[:prefecture_id]
    @companies = Company.where(prefecture_id: method)
  end

  def occupation_search
    method = params[:occupation_genre_id]
    @companies = Company.where(occupation_genre_id: method)
  end
end
