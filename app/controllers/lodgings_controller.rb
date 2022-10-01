class LodgingsController < ApplicationController
  def index
    @lodging = Lodging.all
  end

  def show
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
      redirect_to @lodging
    else
      render :new
    end
  end

  def update
    if @lodging.update(lodging_params)
      redirect_to @lodging
    else
      render :edit
    end
  end

  def destroy
    @lodging.destroy
    redirect_to lodgings_path
  end

  private

  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:name)
  end
end