class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :test]

  def index
    if current_user
      @journeys = Journey.where(user_id: current_user.id)
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

  end

  def waitings
    @journey = Journey.find(params[:id])
  end

  def waitings_act
    @journey = Journey.find(params[:id])
  end

  def has_voted
    @journey = Journey.find(params[:id])
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :user)
  end

end
