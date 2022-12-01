class JourneyDatesController < ApplicationController
  def index
    @journey_dates = JourneyDate.where(journey_id: params[:journey_id])
    @journey = Journey.find(params[:journey_id])
  end

  def new
    @journey_date = JourneyDate.new
    @journey = Journey.find(params[:journey_id])
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @journey_date = JourneyDate.new(journey_date_params)
    @journey_date.journey = @journey
    if @journey_date.save!
      redirect_to journey_journey_accommodations_path(@journey)
    else
      render :new
    end
  end

  private

  def journey_date_params
    params.require(:journey_date).permit(:start_date, :end_date)
  end
end
