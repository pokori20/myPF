class Public::ShiftsController < ApplicationController
  before_action :authenticate_public!
  def show
    @shift = Shift.where(shop_id: params[:id], year_month: params[:year_month])
  end
  private
  def shift_params
    params.require(:shift).permit(:year_month, :shop_name, :image)
  end
end
