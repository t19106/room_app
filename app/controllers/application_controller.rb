class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:user_id]) || User::Logout.new
  end
end
