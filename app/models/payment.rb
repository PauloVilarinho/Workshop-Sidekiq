class Payment < ApplicationRecord
  belongs_to :user

  def process
    # do some processing
    if rand(1..10) == 1
      raise "Error processing payment"
    end
  end
end
