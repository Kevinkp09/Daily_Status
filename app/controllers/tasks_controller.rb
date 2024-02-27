class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @status = Status.find(params["status_id"].to_i)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to task_path(@task)
    else
      render 'new', status: 422
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task updated successfully"
      redirect_to @task
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path
    flash[:notice] = "Task deleted successfully"
  end

  private

  def task_params
    params.require(:task).permit(:start_time, :end_time, :title, :description, :screenshot, :status_id)
  end
end
