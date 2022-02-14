class Public::SubmitOffsController < ApplicationController
  before_action :authenticate_public!

  def new
    @off = Off.new
  end

  def create
    @off = Off.new(off_params)
    @off.shop_id = current_public.shop_id
    @off.public_id = current_public.id
    @off.save
    # submit_offの保存を定義
    # @submit_off = SubmitOff.new(submit_off_params)
    # @submit_off.shop_id = current_public.shop_id
    # @submit_off.save
    redirect_back(fallback_location: root_path)
  end

  private
  def off_params
    params.require(:off).permit(:date)
  end

end
