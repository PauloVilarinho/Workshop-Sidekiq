module Retries
  class RequestWorker
    include Sidekiq::Worker

    def perform
      request
      raise "I'm a bug!"
    end

    def request
      "I'm a request!"
    end
  end
end
