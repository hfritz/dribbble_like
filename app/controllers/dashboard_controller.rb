class DashboardController < ApplicationController
  before_filter :require_user
  def show
    @users = User.all(:conditions => ["pic_file_name is not null and id != (?)", current_user.id])
    @user_likes = current_user.user_likes.map(&:id)
  end

end
