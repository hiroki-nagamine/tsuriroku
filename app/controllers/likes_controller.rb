class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user_ = User.find(params[:like_id])
    current_user.like(record)
    flash[:success] = '釣果にいいね！しました'
    redirect_to user
  end

  def destroy
    user = User.find(params[:like_id])
    current_user.unlike(record)
    flash[:success] = '釣果のいいね！を解除しました'
    redirect_to user
  end
end
