class JourneyMembersController < ApplicationController
  def index
    @journey_members = JourneyMember.where(journey_id: params[:journey_id])
  end

  def new
    @journey_member = JourneyMember.new
  end

  def create
    @journey_member = JourneyMember.new(journey_member_params)
    @user = current_user
    @journey = Journey.find(params[:journey_id])
    @journey_member.user = @user
    if @journey_member.save!
      redirect_to edit_journey_journey_member_path(@journey_member)
    else
      render :new
    end
  end

  def edit
    @journey = Journey.find(params[:journey_id])
    @journey_member = JourneyMember.find(params[:id])
  end

  def update
    @journey_member = JourneyMember.find(params[:id])
    @journey_member.update(journey_member_params)
    redirect_to journey_journey_locations_path(@journey_member.journey)
  end

  private

  def journey_member_params
    params.require(:journey_member).permit(:nickname)
  end
end
