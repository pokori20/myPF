# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
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
  
  def reject_public
    @public = Public.find_by(employee_id: params[:public][:employee_id])
    if @public.valid_password?(params[:public][:password]) && (@public.is_working == false)
      flash[:notice] = "このアカウントは退会済みのため使用できません。"
      redirect_to new_public_session
    else
      flash[:notice] = "項目を入力してください"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
