class FormMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shinsei_mailer.send_when_push.subject
  #
  def send_when_push(student)
    @student = student
    mail to:  student.email_address,
         subject: '申請のあった休退塾届をお送りします。'
  end
end
