class JourneyActivitiesController < ApplicationController

  def index
    @journey_activities = JourneyActivity.where(journey_id: params[:journey_id])
    @journey = Journey.find(params[:journey_id])
  end

  def new
    @journey_activity = JourneyActivity.new
    @journey = Journey.find(params[:journey_id])
    @activities = Activity.all
    @select_activities = @activities.map { |activity| [activity.name, activity.id] }
  end

  def create
    @journey_activity = JourneyActivity.new(journey_activity_params)
    @journey = Journey.find(params[:journey_id])
    @journey_activity.journey = @journey
    if @journey_activity.save!
      redirect_to summary_path(@journey)
    end
  end

  private

  def journey_activity_params
    params.require(:journey_activity).permit(:activity_id)
  end

end
