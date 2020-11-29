class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @q = Student.ransack(params[:q])
    @student = @q.result(district: true)
    respond_to do |format|
      format.html { @student = @student.page(params[:page]) }
    end
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end   
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    end
  end

  def confirm
    @student = Student.new(student_params)
  end

  def destroy_all
    checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
    if @student.destroy_all(checked_data)
      redirect_to students_path
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :course, :enrollment_status, :site, :school_year, :parent_name, :phone_number, :email_address, :live_address)
  end
end
