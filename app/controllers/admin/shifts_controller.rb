class Admin::ShiftsController < ApplicationController
  
  def new
    @shift = Shift.new
  end
  
  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      flash[:notice] = "シフトを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :new
    end
  end

  def index
    @shifts = Shift.all
  end
  
  def show
    @shift = Shift.where(shop_id: params[:id], year_month: params[:year_month])
  end
  
  private
  def shift_params
    params.require(:shift).permit(:year_month, :shop_name, :image)
  end
end
