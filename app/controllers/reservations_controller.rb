class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @lodging = Lodging.find(params[:lodging_id])
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @lodging = Lodging.find(params[:lodging_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.lodging = @lodging
    @reservation.user = current_user
    if @reservation.save
      redirect_to lodging_path(@lodging)
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to lodging_path(@lodging)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to lodging_path
  end

  private

  def set_reservation
    @lodging = Lodging.find(params[:lodging_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :pet_age, :pet_size, :pet_description)
  end
end
