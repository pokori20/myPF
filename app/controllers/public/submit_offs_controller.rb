class Public::SubmitOffsController < ApplicationController
  before_action :authenticate_public!
  
  def new
    @off = Off.new
  end
  
  def create
    @off = Off.new(off_params)
    @off.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  def off_params
    params.require(:off).permit(:date)
  end
  
end
