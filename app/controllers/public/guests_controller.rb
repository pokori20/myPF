class Public::GuestsController < ApplicationController
  def guest_sign_in
    user = Public.find_or_create_by!(name: 'ゲスト' , shop_id: 1 , employee_id: 888888) do |user|
      user.password = SecureRandom.urlsafe_base64
    end

    sign_in user
    redirect_to root_path, notice: 'ゲストでログインしました。'
  end
end
