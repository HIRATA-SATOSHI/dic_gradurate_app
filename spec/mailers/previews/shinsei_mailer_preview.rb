# Preview all emails at http://localhost:3000/rails/mailers/shinsei_mailer
class ShinseiMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shinsei_mailer/send_when_push
  def send_when_push
    ShinseiMailer.send_when_push
  end

end
