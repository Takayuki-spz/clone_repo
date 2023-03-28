class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user,   only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build
    @comments = @micropost.comments.paginate(page: params[:page], per_page: 5)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.study_time_hours = params[:micropost][:study_time_hours]
    @micropost.study_time_minutes = params[:micropost][:study_time_minutes]
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました。"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

    def micropost_params
      study_time_hours, study_time_minutes = params[:micropost][:study_time].split.map(&:to_i)
      params.require(:micropost).permit(:content, :image).merge(study_time_hours: study_time_hours, study_time_minutes: study_time_minutes)
    end
    

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @micropost.nil?
    end
end
