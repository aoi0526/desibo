class User::CompaniesController < ApplicationController
  
  def show
    @comany = Company.find(params[:id])
  end
  
end
