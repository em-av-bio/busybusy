class JourneyLocationsController < ApplicationController

  def index
    @journey_locations = JourneyLocation.where(journey_id: params[:journey_id])
    @journey = Journey.find(params[:journey_id])
    @journey_total_budget = @journey.journey_members.reduce(0) { |sum, member| sum += member.budget unless member.budget.nil? }
    @journey_location = JourneyLocation.new
    @locations = Location.all
    @select_locations = @locations.map { |location| [location.city, location.id] }
  end

  def new
    @journey_location = JourneyLocation.new
    @journey = Journey.find(params[:journey_id])
    @locations = Location.all
    @select_locations = @locations.map { |location| [location.city, location.id] }
  end

  def create
    @journey_location = JourneyLocation.new(journey_location_params)
    @journey = Journey.find(params[:journey_id])
    @journey_location.journey = @journey
    if @journey_location.save!
      redirect_to journey_journey_locations_path(@journey)
    end
  end

  def votes
    @journey_locations = JourneyLocation.where(journey_id: params[:id])
    @journey = Journey.find(params[:id])
  end

  private

  def journey_location_params
    params.require(:journey_location).permit(:location_id)
  end
end
