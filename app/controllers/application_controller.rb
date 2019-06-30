class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  # 事前ログイン認証
  # index,showをログインしていないユーザーには見せないようにする処理
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end 
  end
  
  def counts(user)
    @count_records = user.records.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likings = user.likings.count
  end
end
