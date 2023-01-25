class ApplicationController < ActionController::Base
  include SessionsHelper

  def current_user
    User.find_by(id: session[:user_id]) || User::Logout.new
  end
end
