class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Welcome to Daily Status App."
      redirect_to @employee
    else
      render 'new', status: 422
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Information successfully updated."
      redirect_to @employee
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Account deleted successfully"
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password)
  end
end
