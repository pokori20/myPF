class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    if params[:shop_id].present?
      @shifts = Shift.where(shop_id: params[:shop_id])
    else
      flash[:alert] = '検索する場合は店名を選択してください。'
      redirect_to request.referer
    end
  end
end
