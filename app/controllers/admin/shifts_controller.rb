class Admin::ShiftsController < ApplicationController
  
  def new
    @shift = Shift.new
  end

  def index
    @shifts = Shift.all
  end
end
