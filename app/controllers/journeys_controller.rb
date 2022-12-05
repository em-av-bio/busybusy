class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :test]

  def index
    if current_user
      @journeys = current_user.journeys
    end
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    if @journey.save!
      @journey_member = JourneyMember.new(user_id: current_user.id, journey_id: @journey.id)
      if @journey_member.save!
        redirect_to new_journey_journey_member_path(@journey)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end


  def summary
    @journey = Journey.find(params[:id])
    @activities = @journey.journey_locations.first.location.activities
    @budget_total = 0
    @journey.journey_members.each { |member| @budget_total += member.budget unless member.budget.nil? }
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.activities_voted!
  end

  def waitings
    @journey = Journey.find(params[:id])
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.dates_accepted!
  end

  def waitings_act
    @journey = Journey.find(params[:id])
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.activities_accepted!
  end

  def has_voted
    @journey = Journey.find(params[:id])
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.dates_voted!
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :user)
  end

end
