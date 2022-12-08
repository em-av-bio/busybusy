class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save!
      redirect_to activity_path(@activities)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activities)
  end

  def destroy
    @activity.destroy
  end

  def search
    @journey = Journey.find(params[:journey][:id].to_i)
    @journey_locations = JourneyLocation.where(journey_id: @journey.id)
    @city_voted = @journey_locations.sort_by { |journey_location| journey_location.ranking }.last
    activities_ids = @city_voted.location.activities.pluck(:id)
    if params[:activities_search].present?
      @activities = Activity.where.not(id: activities_ids).where('name ILIKE ?', "%#{params[:activities_search]}%").order(created_at: :desc)
    else
      @activities = Activity.none
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('activities_results',
          partial: 'journey_activities/activities_results',
          locals: { activities: @activities, journey: @journey })
        ]
      end
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :duration_in_h, :details)
  end

end
