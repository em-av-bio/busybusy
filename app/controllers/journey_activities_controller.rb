class JourneyActivitiesController < ApplicationController

  def index
    @journey_activities = JourneyActivity.where(journey_id: params[:journey_id])
  end

  def new
    @journey_activity = JourneyActivity.new
  end

  def create
    @journey_activity = JourneyActivity.new(journey_activity_params)
    @journey = Journey.find(params[:journey_id])
    @activity = Activity.find(params[:activity_id])
    if @journey_activity.save!
      redirect_to journey_journey_activities_path(@journey)
    end
  end

  private

  def journey_activity_params
    params.require(:journey_activity).permit(:activity)
  end

end
