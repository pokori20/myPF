class Admin::PatternsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @patterns = Pattern.all
    @patten = Pattern.new
  end

  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      flash[:notice] = "シフトパターンを追加しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "入力内容を確認してください"
      @patterns = Pattern.all
      render :index
    end
  end
  
  def update
    @pattern = Pattern.find(params[:id])
    if @pattern.update
      flash[:notice] = "シフトパターンを更新しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "入力内容を確認してください"
      @patterns = Pattern.all
      render :index
    end
  end
  
  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def pattern_params
    params.require(:pattern).permit(:alphabet, :hours, :shift_pattern)
  end

end
