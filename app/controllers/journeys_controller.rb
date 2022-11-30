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
    @journey = Journey.new(journey_params)
    @journey.user_id = current_user.id
    if @journey.save!
      @journey_member = JourneyMember.new(user_id: @journey.user_id, journey_id: @journey.id)
      if @journey_member.save!
        redirect_to edit_journey_journey_member_path(@journey, @journey_member)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def test
    
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :user)
  end
end
