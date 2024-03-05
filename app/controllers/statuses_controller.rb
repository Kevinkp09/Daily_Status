class StatusesController < ApplicationController
  def index
    if current_user.admin?
      @statuses = Status.all
    else
      @statuses = current_user.statuses
    end
  end

  def show
    unless current_user
      flash[:notice] = "You are not authorized for this action"
      redirect_to statuses_path
    end
    @status = Status.find(params[:id])
    @tasks = @status.tasks
  end

  def new
   @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.user = current_user
    if @status.save
      AdminMailer.new_status(current_user, @status).deliver_now
      flash[:notice] = "Status added successfully"
      redirect_to status_path(@status)
    else
      render 'new', status: 422
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
       redirect_to status_path
       flash[:notice] = "Status updated successfully"
    else
      render 'edit', status: 422
    end
  end

  private

  def status_params
    params.require(:status).permit(:github_pr_link, :date, :remarks)
  end

end
