class Admin::SubmitOffsController < ApplicationController
  before_action :authenticate_admin!
end
