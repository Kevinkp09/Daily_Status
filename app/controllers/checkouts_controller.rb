class CheckoutsController < ApplicationController
  def process_check_outs
    AdminMailer.check_out(current_user).deliver_now
    redirect_to root_path, notice: "Checkout successfull"
  end
end
