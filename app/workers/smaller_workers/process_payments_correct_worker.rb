module SmallerWorkers
  class ProcessPaymentsCorrectWorker
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find(user_id)
      user.payments.each do |payment|
        ProcessPaymentWorker.perform_async(payment.id)
      end
    end
  end
end
