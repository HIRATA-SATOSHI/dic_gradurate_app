class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, :department, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
