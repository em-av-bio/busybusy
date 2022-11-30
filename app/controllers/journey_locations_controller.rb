class JourneyLocationsController < ApplicationController
  def index
    @journey_locations = JourneyLocation.where(journey_id: params[:journey_id])
  end

  def new
    @journey_location = JourneyLocation.new
  end

  def create
    @journey_location = JourneyLocation.new(journey_location_params)
    @journey = Journey.find(params[:journey_id])
    @location = Location.find(params[:location_id])
    if @journey_location.save!
      redirect_to journey_journey_dates_path(@journey)
    end
  end

  private

  def journey_location_params
    permit.require(:journey_location).permit(:location)
  end
end
