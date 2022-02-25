class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shops = Shop.all
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "店舗を追加しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "入力内容を確認してください"
      @shops = Shop.all
      render :index
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "店名を変更しました"
      redirect_to admin_shops_path
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name)
  end
end
