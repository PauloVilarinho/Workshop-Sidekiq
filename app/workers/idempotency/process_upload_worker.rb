module Idempotency
  class ProcessUploadWorker
    include Sidekiq::Worker

    def perform(upload_id)
      upload = Upload.find(upload_id)
      upload.process
      
      UserMailer.upload_processed(upload.user.email).deliver_now
    end
  end
end
