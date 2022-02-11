class Public::HomesController < ApplicationController
  before_action :authenticate_public!
  def top
  end
end
