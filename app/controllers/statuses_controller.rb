class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
   @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.employee = Employee.first
    if @status.save
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
      flash[:notice] = "Status updated successfully"
      redirect_to @status
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = "Status deleted successfully"
    redirect_to status_path
  end

  private
  def status_params
    params.require(:status).permit(:github_pr_link, :date, :remarks)
  end
end
