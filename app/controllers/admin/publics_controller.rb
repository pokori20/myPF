class Admin::PublicsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @public = Public.new
  end

  def create
    @public = Public.new(public_params)
    if @public.save!
      flash[:notice] = "従業員を追加しました"
      redirect_to admin_publics_path
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :new
    end
  end

  def index
    @publics = Public.all
  end
  
  def edit
    @public = Public.find(params[:id])
  end
  
  def update
    @public = public.find(params[:id])
    if @public.update(public_params)
      flash[:notice] = "従業員情報を変更しました"
      redirect_to admin_publics_path
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :edit
    end
  end

  private
  def public_params
    params.require(:public).permit(:name, :employee_id, :shop_id , :is_working, :password)
  end
end
