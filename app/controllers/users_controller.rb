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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit', status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
