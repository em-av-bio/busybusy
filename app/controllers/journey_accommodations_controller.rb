class JourneyAccommodationsController < ApplicationController
  def index
    @journey_accommodations = JourneyAccommodation.where(journey_id: params[:journey_id])
  end

  def new
    @journey_accommodation = JourneyAccommodation.new
  end

  def create
    @journey_accommodation = JourneyAccommodation.new(journey_accommodation_params)
    @journey = Journey.find(params[:journey_id])
    @accommodation = Accommodation.find(params[:accommodation_id])
    if @journey_accommodation.save!
      redirect_to journey_journey_accommodations_path(@journey)
    end
  end

  private

  def journey_accommodation_params
    permit.require(:journey_accommodation).permit(:accommodation)
  end
end
