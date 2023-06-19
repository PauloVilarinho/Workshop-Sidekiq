class Upload < ApplicationRecord

  def process
    # do some processing
    self.update!(status: 'done')
  end

  def processed?
    self.status == 'done'
  end
end
