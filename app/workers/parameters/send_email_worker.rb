module Parameters
  class SendEmailWorker
    include Sidekiq::Worker

    def perform(user)
      UserMailer.dummy_email(user.email).deliver_now
    end
  end
end
