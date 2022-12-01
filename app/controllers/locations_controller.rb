class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    @location.image_url = @location.get_rand_image
    if @location.save!
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @location.update(location_params)
    redirect_to location_path(@location)
  end

  def destroy
    @location.destroy
  end

  private

  def location_params
    params.require(:location).permit(:city, :country)
  end
end
