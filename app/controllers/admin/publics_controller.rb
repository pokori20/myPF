class Admin::PublicsController < ApplicationController

  def new
    @public = Public.new
  end

  def create
    @public = Public.new(public_params)
    if @public.save
      redirect_to admin_publics_path
    else
      render :new
    end
  end

  def index
    @shop = Shop.find(params[:id])
  end

  private
  def public_params
    params.require(:public).permit(:name, :employee_id, :shop_id , :is_working)
  end
end
