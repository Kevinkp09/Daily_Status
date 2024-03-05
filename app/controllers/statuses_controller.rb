class StatusesController < ApplicationController
 include ApplicationHelper
 before_action :require_same_user, only: [:show,:edit, :update]

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
    @remarks = @status.remarks
  end

  def new
   @status = Status.new
   @status.remarks.build
  end

  def create
    @status = Status.new(status_params)
    @status.user = current_user
    @status.build_remark if admin?
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
    @status.remarks.build if @status.remarks.empty?
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
    params.require(:status).permit(:github_pr_link, :date, remarks_attributes: [:description])
  end

  def require_same_user
    @status = Status.find(params[:id])
    unless current_user.admin? || current_user == @status.user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to statuses_path
    end
  end
end
