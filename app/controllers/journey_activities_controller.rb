class JourneyActivitiesController < ApplicationController
  before_action :set_user, :set_journey, only: [:index, :new, :create]

  def index
    @journey_activities = JourneyActivity.where(journey_id: params[:journey_id])
    @journey_activity = JourneyActivity.new
    @location = @journey.journey_locations.max_by(&:ranking).location
    @activities = @location.activities
    @select_activities = @activities.map { |activity| [activity.name, activity.id] }
  end

  def new
    @journey_activity = JourneyActivity.new
    @activities = Activity.all
    @select_activities = @activities.map { |activity| [activity.name, activity.id] }
  end

  def create
    @journey_activity = JourneyActivity.new(journey_activity_params)
    @journey_activity.journey = @journey
    if @journey_activity.save!
      redirect_to journey_journey_activities_path(@journey)
    end
  end

  def votes
    @journey_activities = JourneyActivity.where(journey_id: params[:id])
    @journey = Journey.find(params[:id])
  end

  def waitings_votes
    @journey = Journey.find(params[:id])
    @journey_members = @journey.journey_members
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.activities_voted!
    @all_good = @journey_members.all? { |member| member.read_attribute_before_type_cast(:status) >= 7 }
    WaitingroomChannel.broadcast_to(
      @journey,
      json: {
        journeyMemberId: @journey_member.id,
        status: @journey_member.read_attribute_before_type_cast(:status),
        allGood: @all_good,
        message: 'Découvrez votre week end !'
      }
    )
  end

  def update_ranking
    @journey = Journey.find(params[:journey_id])
    params[:journey_activities].each do |k, activity|
      journey_activity = JourneyActivity.find(activity[:id])
      journey_activity.ranking += activity[:ranking].to_i
      journey_activity.save!
    end
    redirect_to waitings_votes_path(@journey)
  end

  private

  def journey_activity_params
    params.require(:journey_activity).permit(:activity_id)
  end

  def set_user
    @user = current_user
  end

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end

end
