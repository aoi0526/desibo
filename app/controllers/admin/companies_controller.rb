class Admin::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @posts = Post.where(company_id: @company.id).all.order(created_at: :desc)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to admin_company_path(@company)
  end

  private

  def company_params
    params.require(:company).permit(:email, :name, :detail, :occupation_genre_id, :prefecture_id, :city, :employment_status, :company_image, :is_deleted)
  end
end
