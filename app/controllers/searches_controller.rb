class SearchesController < ApplicationController
  def search
    @records = Room.search_by_area(params[:area]) if params[:genre] == "area"
    @records = Room.search_by_content(params[:content]) if params[:genre] == "content"
  end
end