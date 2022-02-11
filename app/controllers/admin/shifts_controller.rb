class Admin::ShiftsController < ApplicationController
  
  def new
    @shift = Shift.new
  end

  def index
    @shifts = Shift.all
  end
  
  def show
    @shift = Shift.where(shop_id: params[:id], year_month: params[:year_month])
  end
end
