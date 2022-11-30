class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if current_user
      @journeys = Journey.where(user_id: current_user.id)
    end
  end

  def new
    @journey = Journey.new
  end

  def create
    @user = current_user
    @journey.user = @user
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
