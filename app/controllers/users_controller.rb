class UsersController < ApplicationController
  before_action :check_login, only: [:index, :edit, :update]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to signup_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.authenticate_password(user_params[:password_now])
      if current_user.update(user_params)
        redirect_to users_path
      else
        flash.now[:alert] = "操作に失敗しました。"
        redirect_to edit_user_path(current_user)
      end
    else  
      @user = current_user
      flash.now[:alert] = "現在のパスワードが違います。"
      redirect_to edit_user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_now, :avatar)
  end

  def check_login
    redirect_to login_path unless current_user.login?
  end
end
