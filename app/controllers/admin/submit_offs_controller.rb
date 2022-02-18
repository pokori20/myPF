class Admin::SubmitOffsController < ApplicationController
  before_action :authenticate_admin!
  def show
    # @submit_offs = SubmitOff.where(shop_id: params[:id])
    @publics = Public.where(shop_id: params[:id])
  end

  private

end
