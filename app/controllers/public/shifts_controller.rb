class Public::ShiftsController < ApplicationController
  before_action :authenticate_public!
end
