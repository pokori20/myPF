class Public::ShopsController < ApplicationController
  before_action :authenticate_public!
end
