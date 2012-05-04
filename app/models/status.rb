class String
  def sploin(string)
    self.split.join(string)
  end

  def to_method_name
    self.downcase.sploin("_")
  end
end

class Status < ActiveRecord::Base
  belongs_to :user
  attr_accessible :status_id

  STATUSES = [ "Application unfinished", "Application submitted",
    "Review started", "Review finished", "Phone interview",
    "Declined", "Accepted" ]
    
  class_eval do
    STATUSES.each_with_index do |status, index|
      define_method("set_#{status.to_method_name}!") do
        self.status = index
        self.save!
      end
      define_method("is_#{status.to_method_name}?") do
        self.status == index
      end
    end
  end

  def status_id=(val)
    self.status=val
  end

  def status_id
    self.status
  end

  def to_s
    STATUSES[status]
  end
end