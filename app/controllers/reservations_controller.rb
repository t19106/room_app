class ReservationsController < ApplicationController
  before_action :check_login, only: [:index, :new, :create, :confirmation]

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def new
    unless params[:room_id]
      redirect_back(fallback_location: users_path)
    end
    @reservation = current_user.reservations.build(room_id: params[:room_id])
  end

  def confirmation
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(reservation_params[:room_id])
    unless @reservation.valid?
      redirect_to new_reservation_path, flash: { success: "操作に失敗しました。" }, room_id: reservation_params[:room_id]
    end
  end

  def create
    reservation = current_user.reservations.build(reservation_params)
    if reservation.save
      redirect_to reservations_path
    else
      redirect_to new_reservation_path, flash: { success: "操作に失敗しました。" }, room_id: reservation_params[:room_id]
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :guest, :room_id)
  end

  def check_login
    redirect_to login_path unless current_user.login?
  end
end
