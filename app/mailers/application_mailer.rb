class ApplicationMailer < ActionMailer::Base
  default from: 'do-not-reply@passwordless-app.com'
  layout 'mailer'
end
