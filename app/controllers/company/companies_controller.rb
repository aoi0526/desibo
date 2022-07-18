class Company::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @posts = Post.where(company_id: @company.id).all.order(created_at: :desc)
  end

  def edit
    @company = current_company
  end

  def update
    @company = current_company
    @company.update(company_params)
    redirect_to company_company_path(current_company)
  end
  
  def withdraw
    @company = Company.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @company.update(is_deleted: true)
    # セッション情報を全て削除
    reset_session
    redirect_to root_path
  end

  private

  def company_params
    params.require(:company).permit(:email, :name, :detail, :occupation_genre_id, :prefecture_id, :city, :employment_status, :company_image)
  end
end
