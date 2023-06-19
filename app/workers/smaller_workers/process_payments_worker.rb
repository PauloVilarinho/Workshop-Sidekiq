module SmallerWorkers
  class ProcessPaymentsWorker
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find(user_id)
      user.payments.each do |payment|
        payment.process
      end
    end
  end
end
