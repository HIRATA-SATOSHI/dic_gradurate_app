# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/form_mailer/send_when_push
  def send_when_push
    FormMailer.send_when_push
  end

end
