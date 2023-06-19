class UserMailer < ActionMailer::Base
  def dummy_email(user)
    mail(to: user, subject: "Dummy Email")
  end
end
