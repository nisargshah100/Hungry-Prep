class Status < ActiveRecord::Base
  belongs_to :user

  STATUSES = [ "Application unfinished", "Application, submitted", "Review started", "Review finished", "Phone interview", "Declined", "Accepted" ]

  def set_application_unfinished!
    self.status = 0
    self.save
  end

  def set_application_finished!
    self.status = 1
    self.save
  end

  def set_review_started!
    self.status = 2
    self.save
  end

  def set_review_finished!
    self.status = 3
    self.save
  end

  def set_phone_interview!
    self.status = 4
    self.save
  end

  def set_declined!
    self.status = 5
    self.save
  end

  def set_accepted!
    self.status = 6
    self.save
  end

  def get_status
    STATUSES[status]
  end

  def to_s
    get_status
  end

end
