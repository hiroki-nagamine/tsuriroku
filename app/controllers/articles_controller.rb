class ArticlesController < ApplicationController
    before_action :require_user_logged_in
  
  def create
    record = Record.find(params[:record_id])
    current_user.like(record)
    flash[:success] = '釣果にいいね！しました'
    redirect_to root_url
  end

  def destroy
    record = Record.find(params[:record_id])
    current_user.unlike(record)
    flash[:success] = '釣果のいいね！を解除しました'
    redirect_to root_url
  end
end
