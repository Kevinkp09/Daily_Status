class RemarksController < ApplicationController
  def create
    if admin?
      @status = Status.find(params[:status_id])
      @remark = @status.remarks.create(remark_params)
      if @remark.save
        flash[:notice] = "Remark added successfully"
      else
        flash[:alert] = "Remark has not been added"
      end
      redirect_to status_path(@status)
    end
  end

  private

  def remark_params
    params.require(remark).permit(:content, :status_id)
  end
end
