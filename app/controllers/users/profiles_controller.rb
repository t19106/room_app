class Users::ProfilesController < ApplicationController
    before_action :check_login, only: [:edit, :update]
  
    def edit
      @user = current_user
    end

    def update
      if current_user.update(user_params)
        redirect_to users_path
      else
        flash.now[:alert] = "操作に失敗しました。"
        redirect_to edit_user_path(current_user)
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :summary, :avatar)
    end
  
    def check_login
      redirect_to login_path unless current_user.login?
    end
  end
  