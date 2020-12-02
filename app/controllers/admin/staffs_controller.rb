class Admin::StaffsController < ApplicationController
  before_action :admin_staff

  def index
    @staffs = Staff.all.order("created_at DESC")
  end
  
  private
  def admin_staff
    redirect_to(root_path) unless current_staff.admin?
  end 
end
