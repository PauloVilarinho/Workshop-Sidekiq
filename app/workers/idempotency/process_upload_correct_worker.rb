module Idempotency
  class ProcessUploadCorrectWorker
    include Sidekiq::Worker

    def perform(upload_id)
      upload = Upload.find(upload_id)

      return if upload.processed?

      upload.process

      UserMailer.upload_processed(upload.user.email).deliver_now
    end
  end
end
