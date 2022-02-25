class Public::CommentsController < ApplicationController
  before_action :authenticate_public!
  def new
    # ログインユーザーがコメントを投稿済かどうかでcreateかupdate用の変数にするか分岐
    if Comment.exists?(public_id: current_public.id, year_month: Time.current.next_month.strftime("%Y-%-m"))
      @comment = Comment.find_by(public_id: current_public.id, year_month: Time.current.next_month.strftime("%Y-%-m"))
    else
      @comment = Comment.new
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.public_id = current_public.id
    @comment.year_month = Time.current.next_month.strftime("%Y-%-m")
    @comment.save
    flash[:notice] = "コメントを追加しました。"
    redirect_back(fallback_location: root_path)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update
  end

  private

  def comment_params
    params.require(:comment).permit(:remarks)
  end
end
