class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show,:destroy]
  before_action :set_users, only: [:show,:edit]
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
      flash[:success] = 'ユーザーを登録しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update #user情報編集
    if current_user == @user #編集しようとしているユーザーがログインユーザーとイコールかチェック
    
      if @user.update(user_params)
        flash[:success] = 'アングラープロフィールをアップデートしました！'
        render @user
      else
        flash.now[:danger] = 'アングラープロフィールのアップデートに失敗しました'
        render :edit
      end
    else
      redirect_to root_url
    end
  end
  
  def destroy
    if current_user == @user
        @user.destroy
        flash[:success] = 'ツリロクから退会しました'
        redirect_back root_url
    else
        redirect_to root_url
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
