class Company::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = current_company
  end

  def update
    @company = current_company
    @company.update(company_params)
    redirect_to compacompany_path(current_company)
  end

  private

  def company_params
    params.require(:company).permit(:email, :name, :detail, :occupation_genre_id, :prefecture_id, :city, :employment_status, :company_image)
  end
end
