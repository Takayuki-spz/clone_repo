class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "コメントを追加しました。"
    else
      flash[:danger] = "コメントの追加に失敗しました。"
    end
    redirect_to micropost_path(@micropost)
  end
  
  def edit

  end

  def update

  end

  def destroy
    @comment.destroy
    flash[:success] = "コメントを削除しました。"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @comment.nil?
    end
end
