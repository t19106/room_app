class SearchesController < ApplicationController
  before_action :check_login

  def search
    @records = Room.search_by_area(params[:area]) if params[:genre] == "area"
    @records = Room.search_by_content(params[:content]) if params[:genre] == "content"
  end

  private
  def check_login
    redirect_to login_path unless current_user.login?
  end
end