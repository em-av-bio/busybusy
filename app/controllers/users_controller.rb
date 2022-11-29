class UsersController < ApplicationController
  def index
    @users = User.All
  end
end
