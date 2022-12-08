class JourneyLocationsController < ApplicationController

  def index
    @journey_locations = JourneyLocation.where(journey_id: params[:journey_id])
    @journey = Journey.find(params[:journey_id])
    @journey_members = @journey.journey_members
    @journey_total_budget = 0
    @journey.journey_members.each { |member| @journey_total_budget += member.budget unless member.budget.nil? }

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
    if @journey_location.save!
      redirect_to journey_journey_locations_path(@journey)
    end
  end

  def destroy
    @journey = Journey.find(params[:journey_id])
    @journey_location = @journey.journey_locations.find(params[:id])
    @journey_location.destroy
    redirect_to journey_journey_locations_path(@journey)
  end

  def votes
    @journey_locations = JourneyLocation.where(journey_id: params[:id])
    @journey = Journey.find(params[:id])
  end

  def update_ranking
    @journey = Journey.find(params[:journey_id])
    params[:journey_locations].each do |k, location|
      journey_location = JourneyLocation.find(location[:id])
      journey_location.ranking += location[:ranking].to_i
      journey_location.save!
    end
    redirect_to dates_votes_path(@journey)
  end

  private

  def journey_location_params
    params.permit(:location_id, :journey_id)
  end
end
