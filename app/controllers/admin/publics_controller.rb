class Admin::PublicsController < ApplicationController
  before_action :authenticate_admin!

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
    @publics = Public.all
  end

  private
  def public_params
    params.require(:public).permit(:name, :employee_id, :shop_id , :is_working)
  end
end
