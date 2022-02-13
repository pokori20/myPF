class Admin::SubmitOffsController < ApplicationController
  before_action :authenticate_admin!
  def index
    # @submit_offs = SubmitOff.where(shop_id: params[:id])
    @publics = Public.all
  end

  private

end
