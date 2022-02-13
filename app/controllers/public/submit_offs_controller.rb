class Public::SubmitOffsController < ApplicationController
  before_action :authenticate_public!
  
  def new
    @off = Off.new
  end
  
  def create
    @off = Off.new(off_params)
  end
end
