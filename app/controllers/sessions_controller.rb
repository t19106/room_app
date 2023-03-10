class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to login_path, flash: { alert: "操作に失敗しました。" }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
