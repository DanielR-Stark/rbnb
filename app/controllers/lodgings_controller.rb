class LodgingsController < ApplicationController
  def index
    @lodgings = Lodging.all
  end

  def show
    @lodging = Lodging.find(params[:id])
  end

  def new
    @lodging = Lodging.new
  end

  def edit
  end

  def create
    @lodging = Lodging.new(lodging_params)
    @lodging.user = current_user
    if @lodging.save
      redirect_to lodging_path(@lodging)
    else
      render :new
    end
  end

  def update
    if @lodging.update(lodging_params)
      redirect_to lodging_path(@lodging)
    else
      render :edit
    end
  end

  def destroy
    @lodging = Lodging.find(params[:id])
    @lodging.destroy
    redirect_to lodgings_path
  end

  private

  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:animals_taken_care_of, :summary, :name, :home_type, :total_occupancy,
                                    :address, :park_dog, :park_cat, :bath_service, :walk_service, :special_care,
                                    :place_with_pets, :price)
  end
end
