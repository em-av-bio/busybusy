class JourneyDatesController < ApplicationController

  before_action :set_user, :set_journey, only: [:index, :new, :create]

  def index
    @journey_dates = JourneyDate.where(journey_id: params[:journey_id])
    @journey_date = JourneyDate.new
    @journey_member = JourneyMember.find_by(user: current_user, journey: params[:journey_id])
    @journey_member.locations_accepted!
  end

  def new
    @journey_date = JourneyDate.new
  end

  def create
    @journey_date = JourneyDate.new(start_date: start_date, end_date: end_date)
    @journey_date.journey = @journey
    if @journey_date.save!
      redirect_to journey_journey_dates_path(@journey)
    else
      render :new
    end
  end

  def votes
    @journey = Journey.find(params[:id])
    @journey_dates = JourneyDate.where(journey_id: params[:id])
    @journey = Journey.find(params[:id])
    @journey_member = JourneyMember.find_by(user: current_user, journey: @journey)
    @journey_member.locations_voted!
  end

  def update_ranking
    @journey = Journey.find(params[:journey_id])
    params[:journey_dates].each do |k, date|
      journey_date = JourneyDate.find(date[:id])
      journey_date.ranking += date[:ranking].to_i
      journey_date.save!
    end
    redirect_to has_voted_path(@journey)
  end

  private

  def journey_date_params
    params.require(:journey_date).permit(:start_date, :end_date)
  end

  def set_user
    @user = current_user
  end

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end

  def start_date
    params[:journey_date][:dates].split(" to ").first.to_date
  end

  def end_date
    params[:journey_date][:dates].split(" to ").last.to_date
  end
end
