class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show,:destroy]
  before_action :set_users, only: [:show,:edit,:update]
  def index
    @users = User.all.page(params[:id])
  end

  def show
    @records = @user.records.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'アングラー登録が完了しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'アングラー登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update #user情報編集
    if current_user == @user #編集しようとしているユーザーがログインユーザーとイコールかチェック
      if @user.update(user_params)
        flash[:success] = 'アングラープロフィールをアップデートしました！'
        redirect_to @user
      else
        flash.now[:danger] = 'アングラープロフィールのアップデートに失敗しました'
        render :edit
      end
    else
      redirect_to root_url
    end
  end
  
  def destroy
     @user = User.find_by(id: params[:id])
     @records = Record.find_by(user_id: params[:id])
      flash[:notice] = 'ツリロクから退会しました'
      
      if @records.nil? #投稿が存在するか確認。投稿がない場合はユーザーのみ削除
        @user.destroy
        redirect_back(fallback_location: root_path)
      else            #投稿が存在する場合はユーザーと投稿データも一緒に削除
        @user.destroy
        @records.destroy
         redirect_back(fallback_location: root_path)
      end
  end

  private
  
  def set_users
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
  end
end
