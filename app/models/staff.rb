class Staff < ApplicationRecord
  attribute :login_staff_id, :integer
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
  #管理者が最後の一人でありかつ。更新対象者（self)がログインスタッフであり
   if Staff.where(admin: true).count == 1 && self.admin
      throw(:abort)
    end
  end   
   

  def admin_staff_update_action
   #管理者が最後の一人でありかつ、更新対象者(self)がログインスタッフであり、かつ、更新対象者（self)の管理区分がfalseの場合
    @admin_staff = Staff.where(admin: true)
    if  @admin_staff.count == 1 && self.id == login_staff_id && self.admin == false 
       throw(:abort)
    end
  end      
  
end
