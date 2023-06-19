module SmallerWorkers
  class ProcessPaymentWorker
    include Sidekiq::Worker

    def perform(payment_id)
      payment = Payment.find(payment_id)
      payment.process
    end
  end
end
