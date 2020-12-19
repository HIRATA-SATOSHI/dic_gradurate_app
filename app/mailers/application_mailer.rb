class ApplicationMailer < ActionMailer::Base
  default from:     "J PREP休退塾届管理事務局",
          bcc:      "jprepzdm@gmail.com"
  layout 'mailer'
end