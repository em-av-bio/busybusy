class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save!
      redirect_to activity_path(@activities)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activities)
  end

  def destroy
    @activity.destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :duration_in_h, :details)
  end
end
