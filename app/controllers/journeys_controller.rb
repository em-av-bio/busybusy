class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    if @journey.save!
      redirect_to journey(@journey)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :budget_total)
  end
end
