class RoomsController < ApplicationController
  before_action :check_login, only: [:index, :new, :create, :show]

  def index
    @rooms = Room.where(user: current_user)
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    room = current_user.rooms.build(room_params)
    if room.save
      redirect_to rooms_path
    else
      redirect_to new_room_path
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name, :detail, :summary, :price, :address)
  end

  def check_login
    redirect_to login_path unless current_user.login?
  end
end