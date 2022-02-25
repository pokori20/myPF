class Admin::GuestsController < ApplicationController
  def guest_sign_in
    user = Admin.find_or_create_by!(name: 'ゲスト', employee_id: 0o00001) do |t|
      t.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to admin_root_path, notice: 'ゲストでログインしました。'
  end
end
