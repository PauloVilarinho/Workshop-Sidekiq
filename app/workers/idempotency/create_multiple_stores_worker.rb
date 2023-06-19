module Idempotency
  class CreateMultipleStoresWorker
    include Sidekiq::Worker

    def perform
      100.times do
        Store.create(name: "Dummy Name", address: "Dummy Address")
      end
      raise "I'm a bug!"
    end
  end
end
