class JourneyDatesController < ApplicationController
  before_action :set_user, :set_journey

  def index
    @journey_dates = JourneyDate.where(journey_id: params[:journey_id])
    @journey_date = JourneyDate.new
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:journey_id])
    @journey_member.locations_accepted!
  end

  def new
    @journey_date = JourneyDate.new
  end

  def create
    @journey_date = JourneyDate.new(journey_date_params)
    @journey_date.journey = @journey
    if @journey_date.save!
      redirect_to journey_journey_dates_path(@journey)
    else
      render :new
    end
  end

  def votes
    @journey_dates = JourneyDate.where(journey_id: params[:id])
    @journey = Journey.find(params[:id])
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.locations_voted!
  end

  private

  def journey_date_params
    params.require(:journey_date).permit(:start_date, :end_date)
  end

  def set_user
    @user = current_user
  end

  def set_journey
    @journey = Journey.find(params[:id])
  end
end
