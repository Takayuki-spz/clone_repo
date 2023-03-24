class StaticPagesController < ApplicationController
  def home
    @latest_users = User.all.order(created_at: :desc).take(5)
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page],per_page: 10)
    else
      @feed_items = Micropost.paginate(page: params[:page],per_page: 10)
    end
  end
end
