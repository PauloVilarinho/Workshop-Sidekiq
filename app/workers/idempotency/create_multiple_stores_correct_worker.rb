module Idempotency
  class CreateMultipleStoresCorrectWorker
    include Sidekiq::Worker

    def perform
      ActiveRecord::Base.transaction do
        100.times do
          Store.create(name: "Dummy Name", address: "Dummy Address")
        end
        raise "I'm a bug!"
      end
    end
  end
end
