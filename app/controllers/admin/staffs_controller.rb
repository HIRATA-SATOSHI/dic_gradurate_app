class Admin::StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :destroy, :update]
  before_action :require_admin

  def index
    @staff = Staff.all.order("created_at DESC")
    @staff = @staff.page(params[:page]) 
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to admin_staffs_path, notice: "ユーザー「#{@staff.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      flash[:notice] =  "スタッフ #{@staff.name} 更新しました"
      redirect_to admin_staffs_path
    else
      render :edit, notice: "管理者がいなくなりますので更新はできません"
    end
  end

  def show
  end

  def destroy
    if @staff.destroy
      redirect_to admin_staffs_path, notice: "ユーザー #{@staff.name} を削除しました"
    else
      redirect_to admin_staffs_path, notice: "管理者がいなくなりますので削除はできません"
    end
  end
  
  private
  def require_admin
    unless current_staff.admin?
        redirect_to students_path, notice: "あなたは管理者ではありません"
    end
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name, :email, :password, :password_confirmation, :department, :admin )
  end
end
