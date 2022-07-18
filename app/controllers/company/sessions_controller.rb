# frozen_string_literal: true

class Company::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected


  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_company
    @company = Company.find_by(email: params[:company][:email])
    if @company
      if @company.valid_password?(params[:user][:password]) && (@company.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_company_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end


  def after_sign_in_path_for(resource)
    company_company_path(current_company.id)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def guest_sign_in
    company = Company.guest
    sign_in company
    redirect_to company_company_path(current_company.id)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
