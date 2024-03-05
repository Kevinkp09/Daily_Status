class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  def after_sign_in_path_for(resource)
    unless current_user.admin?
        @current_user = resource
        AdminMailer.check_in(resource).deliver_now
        @user
    else
      statuses_path
    end
  end
end
