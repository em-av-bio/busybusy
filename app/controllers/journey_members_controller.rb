class JourneyMembersController < ApplicationController
  def index
    @journey_members = JourneyMember.where(journey_id: params[:journey_id])
  end

  def new
    @journey_member = JourneyMember.new
    @journey = Journey.find(params[:journey_id])
    @users = User.all
    @select_users = @users.map { |user| [user.nickname, user.id] }
  end

  def create
    @journey_member = JourneyMember.new(journey_member_params)
    @journey = Journey.find(params[:journey_id])
    @journey_member.journey = @journey
    if @journey_member.save!
      redirect_to new_journey_journey_member_path(@journey)
    end
  end

  def edit
    @journey = Journey.find(params[:journey_id])
    @journey_member = current_user
  end

  def update
    @journey_member = JourneyMember.find(params[:id])
    @journey_member.update(journey_member_params)
    redirect_to journey_journey_locations_path(@journey_member.journey)
  end

  private

  def journey_member_params
    params.require(:journey_member).permit(:user_id)
  end
end
