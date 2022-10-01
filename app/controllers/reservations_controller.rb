class ReservationsController < ApplicationController

  before_action :set_reservation, only: %i[show, edit, update, destroy]

  def index
    @reservation = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:name)
  end
end
