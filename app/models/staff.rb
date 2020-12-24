class Staff < ApplicationRecord
  before_destroy :admin_staff_destroy_action
  before_update :admin_staff_update_action
  validates :name, :department, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum department: {school_admin: 0,
         support_desk: 1,
         enrolled_management: 2,
         logistics: 3,
         accounting: 4,
         management_department: 5
       }

  private

  def admin_staff_destroy_action
    if Staff.where(admin: true).count == 1 && current_staff.admin?
      throw(:abort)
    end
  end   
   
  def admin_staff_update_action
    @admin_staff = Staff.where(admin: true)
    if (@admin_staff.count == 1 && @admin_staff.first == self) && current_staff.admin?     
      throw :abort        
    end
  end      
  
end
