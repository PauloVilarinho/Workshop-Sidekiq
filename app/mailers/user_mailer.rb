class UserMailer < ActionMailer::Base
  def dummy_email(email)
    mail(to: email, subject: "Dummy Email")
  end
end
