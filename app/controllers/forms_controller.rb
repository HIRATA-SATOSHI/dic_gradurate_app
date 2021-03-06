class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy ]

  def index
    @q = Form.ransack(params[:q])
    @form = @q.result(district: true).order(id: :desc)
    # @forms = Form.all
  end

  def show
  end

  def new
    @form = Form.new
  end

  def edit
  end

  def create
    @form = Form.new(form_params)
    if params[:back]
      render :new    
    else
      if @form.save
        redirect_to done_forms_path
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
    end
  end

  def confirm
    @form = Form.new(form_params)
    render :new if @form.invalid?
  end

  def back
    @form = Form.new(form_params)
		render :new
  end
  
  def done
  end

  
  private
  def set_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:number, :name, :application_date, :classification, :month, :f_month, :reason, :comment, :status, :cancel)
  end

end