class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create

    @student = Student.new(student_params)
    redirect_to students_path
  end

  def index
   @students= Student.all
  end

  def show
  end

  def edit
  end

  private
  def student_params
    params.require(:student).permit(:name, :course, :enrollment_status, :site, :school_year, :parent_name, :phone_number, :email_address, :live_address)
  end
end
