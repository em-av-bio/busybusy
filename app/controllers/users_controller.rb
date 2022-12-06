class UsersController < ApplicationController
  def index
    @users = User.All
  end

  def search
    @journey = Journey.find(params[:journey][:id].to_i)
    @users = User.where('nickname ILIKE ?', "%#{params[:nickname_search]}%").order(created_at: :desc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('search_results',
          partial: 'users/search_results',
          locals: { users: @users, journey: @journey })
        ]
      end
    end
  end
end
