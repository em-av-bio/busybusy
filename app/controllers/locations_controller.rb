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

  def search
    @locations = Location.where('city ILIKE ?', "%#{params[:locations_search]}%").order(created_at: :desc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('locations_results',
          partial: 'journey_locations/search_results',
          locals: { locations: @locations })
        ]
      end
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :country)
  end
end
