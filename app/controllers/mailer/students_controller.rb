class Mailer::StudentsController < ApplicationController
    def send_form
      FormMailer.send_when_push(Student.find(params[:student_id])).deliver
      redirect_to student_path(params[:student_id])
    end
end
