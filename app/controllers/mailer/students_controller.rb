class Mailer::StudentsController < ApplicationController
    def send_form
      FormMailer.send_when_push(Student.find(params[:student_id])).deliver
      redirect_to student_path(params[:student_id]), notice: " この生徒へ休塾・退塾の申請フォームを送りました"
    end
end


