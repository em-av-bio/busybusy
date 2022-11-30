class JourneyDatesController < ApplicationController

  def index
    @journey_dates = JourneyDate.where(journey_id: params[:journey_id])
  end

  def new
    @journey_date = JourneyDate.new
  end

  def create
    @journey_date = JourneyDate.new(journey_date_params)
    @journey = Journey.find(params[:journey_id])
    @date = Date.find(params[:date_id])
    if @journey_date.save!
      redirect_to journey_journey_accommodations_path(@journey)
    end
  end

  private

  def journey_date_params
    permit.require(:journey_date).permit(:date)
  end
end
