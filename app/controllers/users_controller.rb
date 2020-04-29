class UsersController < ApplicationController
  
  #ログインしているかを確認する
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user_id
      redirect_to login_path
    
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  #新規会員情報を保持する
  def new_login
    User.find(session[:user_id])
  end
  
end
