class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

end
