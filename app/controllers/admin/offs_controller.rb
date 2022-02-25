class Admin::OffsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @publics = Public.where(shop_id: params[:id])
  end
  
end
