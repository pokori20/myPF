class Admin::ShiftsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @shift = Shift.new
  end

  def index
    # 投稿月度が近い順に表示するようにソート
    # sqliteではorder.("year_month")で問題ないがMySQlではyear_monthだけではどのカラムか特定できずエラーが出ていたため、shifts.year_monthに
    @shifts = Shift.order("shifts.year_month DESC").includes(:shop).page(params[:page]).per(6)
  end

  def create
    @shift = Shift.new(shift_params)
    # binding.pry
    # データをdate型で取得していないからTime.zone.parseでdate型に変換.strftimeで文字列で保存
    @shift.year_month = shift_params["year_month(1i)"] + "-" + shift_params["year_month(2i)"]
    if @shift.save
      flash[:notice] = "シフトを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "入力内容を確認してください"
      @shift = Shift.new
      render :new
    end
  end

  def show
    # whereは複数データを取得。一つしかない場合はfind_byでデータを取得する find_byで条件に合致するものが複数見つかった場合は先に見つかった1件のみを表示
    @shift = Shift.where(shop_id: params[:id], year_month: params[:year_month])
  end

  private

  def shift_params
    params.require(:shift).permit(:year_month, :shop_id, :image)
  end
end
