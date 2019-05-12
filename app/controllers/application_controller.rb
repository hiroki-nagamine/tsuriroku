class ApplicationController < ActionController::Base
  protect_form_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  # 事前ログイン認証
  # index,showをログインしていないユーザーには見せないようにする処理
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end 
  end
end
