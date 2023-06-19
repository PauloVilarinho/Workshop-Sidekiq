module Parameters
  class SendEmailCorrectWorker
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find(user_id)
      UserMailer.dummy_email(user.email).deliver_now
    end
  end
end
