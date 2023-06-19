module Parameters
  class SendEmailWrongWorker
    include Sidekiq::Worker

    def perform(email)
      UserMailer.dummy_email(email).deliver_now
    end
  end
end

