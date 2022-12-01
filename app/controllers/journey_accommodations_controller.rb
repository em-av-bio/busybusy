class JourneyAccommodationsController < ApplicationController
  def index
    @journey_accommodations = JourneyAccommodation.where(journey_id: params[:journey_id])
    @journey = Journey.find(params[:journey_id])
  end

  def new
    @journey_accommodation = JourneyAccommodation.new
    @journey = Journey.find(params[:journey_id])
    @accommodations = Accommodation.all
    @select_accommodations = @accommodations.map { |accommodation| [accommodation.name, accommodation.id] }
  end

  def create
    @journey_accommodation = JourneyAccommodation.new(journey_accommodation_params)
    @journey = Journey.find(params[:journey_id])
    @journey_accommodation.journey = @journey
    if @journey_accommodation.save!
      redirect_to journey_journey_activities_path(@journey)
    end
  end

  private

  def journey_accommodation_params
    params.require(:journey_accommodation).permit(:accommodation_id)
  end
end
