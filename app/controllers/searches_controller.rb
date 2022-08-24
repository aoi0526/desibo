class SearchesController < ApplicationController

  def company_search
    prefecture = params[:prefecture_id]
    occupation = params[:occupation_genre_id]
    employmentstatus = params[:employment_status]
    
    #都道府県のみを選択
    if occupation == "" && employmentstatus == ""
      @companies = Company.where(prefecture_id: prefecture).page(params[:page]).per(2)
      
    #職種のみを選択
    elsif prefecture == "" && employmentstatus == ""
      @companies = Company.where(occupation_genre_id: occupation).page(params[:page]).per(2)
      
    #雇用形態のみを選択
    elsif occupation == "" && prefecture == ""
      @companies = Company.where(employment_status: employmentstatus).page(params[:page]).per(2)
      
    #職種と雇用形態を選択
    elsif prefecture == ""
      @companies = Company.where(occupation_genre_id: occupation).where(employment_status: employmentstatus).page(params[:page]).per(2)
      
    #都道府県と雇用形態を選択
    elsif occupation == ""
      @companies = Company.where(prefecture_id: prefecture).where(employment_status: employmentstatus).page(params[:page]).per(2)
      
    #都道府県と職種を選択
    elsif employmentstatus == ""
      @companies = Company.where(prefecture_id: prefecture).where(occupation_genre_id: occupation).page(params[:page]).per(2)
      
    #全てを選択
    else
      @companies = Company.where(prefecture_id: prefecture).where(occupation_genre_id: occupation).where(employment_status: employmentstatus).page(params[:page]).per(2)
    end
  end

end
