class UsersController < ApplicationController

  def index
    @statuses = current_user.statuses
    if current_user.role == "admin"
       @users = User.all
    end
  end

  def show
     @user = current_user
     @statuses = @user.statuses
  end
end
