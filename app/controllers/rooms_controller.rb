class RoomsController < ApplicationController
  before_action :check_login, only: [:new, :create]

  def new
    @room = current_user.rooms.build
  end

  def create
    room = current_user.rooms.build(room_params)
    if room.save
      @room = current_user.rooms.build
      render 'new'
    else
      #not yet written
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :detail, :summary, :price, :address)
  end

  def check_login
    redirect_to login_path unless current_user.login?
  end
end