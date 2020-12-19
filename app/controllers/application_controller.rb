class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_staff
  def after_sign_in_path_for(resource)
    students_path
  end

  def set_current_staff
    @current_staff = Staff.find_by(id: session[:staff_id])
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :department, :admin])
  end
end
