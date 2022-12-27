class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :test]

  def index
    if current_user
      @journeys = current_user.journeys.order(created_at: :desc)
    end
    @cities_voted = []
    @journeys.each do |journey|
      @city_voted = journey.journey_locations.sort_by { |journey_location| journey_location.ranking }.last.location
      @cities_voted << @city_voted
      @count = journey.journey_members.count
      @name = journey.name
      @journey_dates = JourneyDate.where(journey_id: journey.id)
      @date_voted = @journey_dates.sort_by { |journey_date| journey_date.ranking }.last
    end
    @markers = @cities_voted.map do |city| {
      lat: city.latitude,
      lng: city.longitude,
      info_window: render_to_string(partial: 'info_window', locals: {city: city})
    }
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
    @journey_locations = JourneyLocation.where(journey_id: @journey.id)
    @journey_dates = JourneyDate.where(journey_id: @journey.id)
    @journey_activities = JourneyActivity.where(journey_id: @journey.id)
    @journey_members = @journey.journey_members
    @journey_total_budget = 0
    @journey.journey_members.each { |member| @journey_total_budget += member.budget unless member.budget.nil? }
    @city_voted = @journey_locations.sort_by { |journey_location| journey_location.ranking }.last
    @date_voted = @journey_dates.sort_by { |journey_date| journey_date.ranking }.last
    @activities = JourneyActivity.where(journey_id: @journey.id)
    @activities_sorted = @journey_activities.sort_by { |activity| activity.ranking }.reverse
    @activity_voted = @journey_activities.sort_by { |activity| activity.ranking }.last
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.activities_voted!
  end

  def waitings
    @journey = Journey.find(params[:id])
    @journey_members = @journey.journey_members
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.dates_accepted!
    @all_good = @journey_members.all? { |member| member.read_attribute_before_type_cast(:status) >= 3 }
    WaitingroomChannel.broadcast_to(
      @journey,
      json: {
        journeyMemberId: @journey_member.id,
        status: @journey_member.read_attribute_before_type_cast(:status),
        allGood: @all_good,
        message: 'Place aux votes !'
      }
    )
  end

  def waitings_act
    @journey = Journey.find(params[:id])
    @journey_members = @journey.journey_members
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_member.activities_accepted!
    @all_good = @journey_members.all? { |member| member.read_attribute_before_type_cast(:status) >= 6 }
    WaitingroomChannel.broadcast_to(
      @journey,
      json: {
        journeyMemberId: @journey_member.id,
        status: @journey_member.read_attribute_before_type_cast(:status),
        allGood: @all_good,
        message: 'Place aux votes !'
      }
    )
  end

  def has_voted
    @journey = Journey.find(params[:id])
    @journey_members = @journey.journey_members
    @journey_member = JourneyMember.find_by(user_id: current_user.id, journey_id: params[:id])
    @journey_locations = JourneyLocation.where(journey_id: @journey.id)
    @journey_dates = JourneyDate.where(journey_id: @journey.id)
    @city_voted = @journey_locations.sort_by { |journey_location| journey_location.ranking }.last
    @date_voted = @journey_dates.sort_by { |journey_date| journey_date.ranking }.last
    @journey_member.dates_voted!
    @all_good = @journey_members.all? { |member| member.read_attribute_before_type_cast(:status) >= 5 }
    WaitingroomChannel.broadcast_to(
      @journey,
      json: {
        journeyMemberId: @journey_member.id,
        status: @journey_member.read_attribute_before_type_cast(:status),
        allGood: @all_good,
        message: 'Place aux activités !',
        infos: {
          city: @city_voted.location.city,
          startDate: @date_voted.start_date.strftime('%d/%m/%Y'),
          endDate: @date_voted.end_date.strftime('%d/%m/%Y'),
          city_url: @city_voted.location.image_url
        }
      }
    )
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :user)
  end
end
