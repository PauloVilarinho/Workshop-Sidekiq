module Retries
  class RequestCorrectWorker
    include Sidekiq::Worker

    sidekiq_options retry: false, queue: :default

    def perform
      request
      raise "I'm a bug!"
    end

    def request
      "I'm a request!"
    end
  end
end

