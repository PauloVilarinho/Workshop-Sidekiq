module Lock
  class ProcessTransactionCorrectWorker
    include Sidekiq::Worker

    def perform(giver_id, receiver_id, amount)
      ActiveRecord::Base.transaction do
        giver = User.find_by(id: giver_id).lock!
        receiver = User.find_by(id: receiver_id).lock!
        giver.balance -= amount
        receiver.balance += amount
        giver.save!
        receiver.save!
      end
    end
  end
end
