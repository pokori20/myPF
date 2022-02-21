class Public::OffsController < ApplicationController
    before_action :authenticate_public!

  def new
    @off = Off.new
  end

  def create
    @off = Off.new(off_params)
    @off.shop_id = current_public.shop_id
    @off.public_id = current_public.id
    @off.save
    flash[:notice] = "休み希望を追加しました"
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @off = Off.find_by(date: params[:date])
    @off.destroy
    flash[:alert] = "休み希望を取り消しました"
    redirect_back(fallback_location: root_path)
  end

  private
  def off_params
    params.require(:off).permit(:date)
  end
end
